<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

// -----------------------------------------------------------------------------

class MY_Model extends CI_Model
{
	public function __construct(){
		$this->load->database();
	}
	/**
	 *	Ins�re une nouvelle ligne dans la base de donn�es.
	 */
	public function create($options_echappees = array(), $options_non_echappees = array())
	{
		//	V�rification des donn�es � ins�rer
		if(empty($options_echappees) AND empty($options_non_echappees))
		{
			return false;
		}
		$this->db->set($options_echappees)
				 ->set($options_non_echappees, null, false)
				 ->insert($this->table);
		return  $this->db->insert_id();
	}
	/**
	 *	R�cup�re des donn�es dans la base de donn�es.
	 */
	public function read( $where = array(),$select = '*', $nb = null, $debut = null,$option="")
	{
		
		$query=false;
		$sql=" ";
		if(!is_array($where)){
			$sql=" ".$where." ";
			$query=true;
		}
		if($query){
			$query = $this->db->query($sql);
			return $query->result();
		}else{
			$not_escape=null;
			if(is_array($select)){
				if(array_key_exists("escape", $select)){
					$not_escape=$select["escape"];
					unset($select["escape"]);
					$select=implode(',', $select);
				}
			}
			$this->db->select($select,$not_escape)
				->from($this->table);
			if(is_array($where) && !empty($where)){
				foreach ($where as $key=>$values) {
					$escape=true;
					if(is_array($values)){
						$escape=false;
						foreach ($values as $keyVal=>$value) {
							$this->db->where($value, "", $escape);
						}
					}else{
						$this->db->where($key, $values, $escape);
					}
				}
			}else{
				$this->db->where($where);
			}
			
			foreach($this->join As $table){
                                $this->db->join($table["join"],$table["on"],$table["param"]);
                            }
                            if($nb != null and $debut != null){
                                $this->db->limit($nb, $debut);
                            }
                            $data=  $this->db->get()
                                    ->result_array();
                return $data;
		}
                            
	}
	
	/**
	 *	Modifie une ou plusieurs lignes dans la base de donn�es.
	 */
	public function update($where, $options_echappees = array(), $options_non_echappees = array())
	{		
		//	V�rification des donn�es � mettre � jour
		if(empty($options_echappees) AND empty($options_non_echappees))
		{
			return false;
		}
		
		//	Raccourci dans le cas o� on s�lectionne l'id
		if(is_integer($where))
		{
			$where = array('id' => $where);
		}

		 $this->db->set($options_echappees)
				  ->set($options_non_echappees, null, false);
				  
		if(is_array($where) && !empty($where)){
			foreach ($where as $key=>$values) {
				$escape=true;
				if(is_array($values)){
					$escape=false;
					foreach ($values as $keyVal=>$value) {
						$this->db->where($value, "", $escape);
					}
				}else{
					$this->db->where($key, $values, $escape);
				}
			}
		}else{
			$this->db->where($where);
		}
		return (bool)	$this->db->update($this->table);

	}
	
	/**
	 *	Supprime une ou plusieurs lignes de la base de donn�es.
	 */
	public function delete($where)
	{
		if(is_integer($where))
		{
			$where = array('id' => $where);
		}
		
		return (bool) $this->db->where($where)
							   ->delete($this->table);
	}
	
	/**
	 *	Retourne le nombre de r�sultats.
	 */
	public function count($champ = array(), $valeur = null)
	// Si $champ est un array, la variable $valeur sera ignor�e par la m�thode where()
	{
		return (int) $this->db->where($champ, $valeur)
								  ->from($this->table)
								  ->count_all_results();
	}
	public function query($query)
	{
		$this->db->query($query);
	}
	/**
	 *	Si des enregistrements corréspondent, on met à jours, sinon on crée
	 */
	public function merge($needle, $options_echappees=array(), $options_non_echappees = array()){
		if($this->count($needle)){
			return $this->update($needle,$options_echappees,$options_non_echappees);
		}else{

           	$merged_options_echappees=array_merge($options_echappees,$needle);
			return $this->create($merged_options_echappees,$options_non_echappees);
		}
	}
}

/* End of file MY_Model.php */
/* Location: ./system/application/core/MY_Model.php */