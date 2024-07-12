<div class="info" id="changeColor">
    <div class="tab-content tab-content-info typography">
        <h5>Information</h5>
        <link href="http://rohi.mef.gov.mg:8088/ROHI/assets/light/assets/css/charts.min.css" rel="stylesheet">
        <div class="mb-0 detailTj" style="font-size:14px;">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="profile-view">
                            <div class="profile-basic1">
                                <div class="row">
                                    <h6>&nbsp;</h6>
                                </div>
                                <div class="col-lg-5 col-sm-7 col-md-5 col-xl-4" style="float:left;margin-top:10px;">
                                    <div class="card">
                                        <br>
                                        <!-- Placez l'image ici pour qu'elle ne soit pas affectée par le scroll -->
                                        <div style="text-align: center; margin-bottom: 20px;">
                                            <img width="50px" height="50px" src="http://rohi.mef.gov.mg:8088/ROHI//assets/img/fpdf/ss/dgt.png">
                                        </div>
                                        <!-- Zone de contenu avec scroll -->
                                        <div class="card-body" style="align-center;">
                                            <div class="pro-deadline m-b-15">
                                                <div class="sub-title">
                                                    <br>Nombre de dossier validé : <strong>{$oGetInfo->VALIDE}</strong>
                                                </div>
                                                <div class="sub-title">Nombre de dossier rejeté : <strong>{$oGetInfo->REJET}</strong></div>
                                            </div>

                                            <p>
												{assign var=num1 value=$oGetInfo->VALIDE/$oGetInfo->VALIDEAUTRE}
                                                <span class="text-success float-end">{$num1|number_format:2:",":"."}%</span>
                                                validés par rapport au autre poste comptable
                                            </p>
                                            <div class="progress progress-xs mb-0">
                                                <div class="progress-bar bg-success" role="progressbar" data-bs-toggle="tooltip" title='{$num1}%' style='width: {$num1}%'></div>
                                            </div>
											
                                            <p>
                                                {assign var=num2 value=$oGetInfo->REJET/$oGetInfo->REJETAUTRE}
												<span class="text-danger float-end">{$num2|number_format:2:",":"."}%</span>
                                                rejetés par rapport au autre poste comptable
                                            </p>
                                            <div class="progress progress-xs mb-0">
                                                <div class="progress-bar bg-danger" role="progressbar" data-bs-toggle="tooltip" title='{$num2}%' style='width: {$num2}%'></div>
                                            </div>
											
											<!--
                                            <div class="pro-deadline m-b-15">
                                                <div>
                                                    <br>
                                                    <b>Liste des structures :</b>
                                                </div>
                                                <div class="sub-title">
                                                    <br>
                                                    ACCTDP <br>
                                                    <u>Région</u>
                                                    : Analamanga<br>
                                                    <u>District</u>
                                                    : Antananarivo Renivohitra
                                                </div>
                                                
                                            </div>
											-->
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12" style="margin-top:10px;">
									<div class="card">
										<div class="card-body" style="align-center;">
											 <canvas id="structurePyramidChart"></canvas>
											<br>
											<br>
											<canvas id="mefPyramidChart"></canvas>
										</div>
									</div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>
        .detailTj a.bleu {
            color: #337ab7!important;
            text-decoration: none;
        }
    </style>
   <script type="text/javascript">
        const ctx = document.getElementById("structurePyramidChart").getContext('2d');
        const ctxMef = document.getElementById("mefPyramidChart").getContext('2d');
       

		const data = [{
            {$zAfficheValide}
           
        }, {
            {$zAfficheRefus}
        }];

		
        const dataMef = [{
            "19": {
                "compte": "3",
                "age": "19",
                "sexe": "0"
            },
            "20": {
                "compte": "3",
                "age": "20",
                "sexe": "0"
            },
            "21": {
                "compte": "4",
                "age": "21",
                "sexe": "0"
            },
            "22": {
                "compte": "3",
                "age": "22",
                "sexe": "0"
            },
            "23": {
                "compte": "8",
                "age": "23",
                "sexe": "0"
            },
            "24": {
                "compte": "23",
                "age": "24",
                "sexe": "0"
            },
            "25": {
                "compte": "26",
                "age": "25",
                "sexe": "0"
            },
            "26": {
                "compte": "38",
                "age": "26",
                "sexe": "0"
            },
            "27": {
                "compte": "49",
                "age": "27",
                "sexe": "0"
            },
            "28": {
                "compte": "62",
                "age": "28",
                "sexe": "0"
            },
            "29": {
                "compte": "91",
                "age": "29",
                "sexe": "0"
            },
            "30": {
                "compte": "109",
                "age": "30",
                "sexe": "0"
            },
            "31": {
                "compte": "136",
                "age": "31",
                "sexe": "0"
            },
            "32": {
                "compte": "178",
                "age": "32",
                "sexe": "0"
            },
            "33": {
                "compte": "161",
                "age": "33",
                "sexe": "0"
            },
            "34": {
                "compte": "194",
                "age": "34",
                "sexe": "0"
            },
            "35": {
                "compte": "214",
                "age": "35",
                "sexe": "0"
            },
            "36": {
                "compte": "202",
                "age": "36",
                "sexe": "0"
            },
            "37": {
                "compte": "229",
                "age": "37",
                "sexe": "0"
            },
            "38": {
                "compte": "204",
                "age": "38",
                "sexe": "0"
            },
            "39": {
                "compte": "229",
                "age": "39",
                "sexe": "0"
            },
            "40": {
                "compte": "233",
                "age": "40",
                "sexe": "0"
            },
            "41": {
                "compte": "210",
                "age": "41",
                "sexe": "0"
            },
            "42": {
                "compte": "208",
                "age": "42",
                "sexe": "0"
            },
            "43": {
                "compte": "199",
                "age": "43",
                "sexe": "0"
            },
            "44": {
                "compte": "197",
                "age": "44",
                "sexe": "0"
            },
            "45": {
                "compte": "173",
                "age": "45",
                "sexe": "0"
            },
            "46": {
                "compte": "181",
                "age": "46",
                "sexe": "0"
            },
            "47": {
                "compte": "160",
                "age": "47",
                "sexe": "0"
            },
            "48": {
                "compte": "157",
                "age": "48",
                "sexe": "0"
            },
            "49": {
                "compte": "142",
                "age": "49",
                "sexe": "0"
            },
            "50": {
                "compte": "149",
                "age": "50",
                "sexe": "0"
            },
            "51": {
                "compte": "142",
                "age": "51",
                "sexe": "0"
            },
            "52": {
                "compte": "123",
                "age": "52",
                "sexe": "0"
            },
            "53": {
                "compte": "100",
                "age": "53",
                "sexe": "0"
            },
            "54": {
                "compte": "99",
                "age": "54",
                "sexe": "0"
            },
            "55": {
                "compte": "107",
                "age": "55",
                "sexe": "0"
            },
            "56": {
                "compte": "98",
                "age": "56",
                "sexe": "0"
            },
            "57": {
                "compte": "79",
                "age": "57",
                "sexe": "0"
            },
            "58": {
                "compte": "85",
                "age": "58",
                "sexe": "0"
            },
            "59": {
                "compte": "81",
                "age": "59",
                "sexe": "0"
            },
            "60": {
                "compte": "22",
                "age": "60",
                "sexe": "0"
            },
            "61": {
                "compte": "2",
                "age": "61",
                "sexe": "0"
            },
            "62": {
                "compte": 0,
                "age": "62",
                "sexe": 0
            },
            "63": {
                "compte": 0,
                "age": "63",
                "sexe": 0
            },
            "64": {
                "compte": "1",
                "age": "64",
                "sexe": "0"
            },
            "65": {
                "compte": 0,
                "age": "65",
                "sexe": 0
            },
            "66": {
                "compte": 0,
                "age": "66",
                "sexe": 0
            },
            "68": {
                "compte": "1",
                "age": "68",
                "sexe": "0"
            }
        }, {
            "19": {
                "compte": 2,
                "age": "19",
                "sexe": 1
            },
            "20": {
                "compte": 3,
                "age": "20",
                "sexe": 1
            },
            "21": {
                "compte": 3,
                "age": "21",
                "sexe": 1
            },
            "22": {
                "compte": 7,
                "age": "22",
                "sexe": 1
            },
            "23": {
                "compte": 9,
                "age": "23",
                "sexe": 1
            },
            "24": {
                "compte": 17,
                "age": "24",
                "sexe": 1
            },
            "25": {
                "compte": 18,
                "age": "25",
                "sexe": 1
            },
            "26": {
                "compte": 34,
                "age": "26",
                "sexe": 1
            },
            "27": {
                "compte": 58,
                "age": "27",
                "sexe": 1
            },
            "28": {
                "compte": 82,
                "age": "28",
                "sexe": 1
            },
            "29": {
                "compte": 100,
                "age": "29",
                "sexe": 1
            },
            "30": {
                "compte": 141,
                "age": "30",
                "sexe": 1
            },
            "31": {
                "compte": 159,
                "age": "31",
                "sexe": 1
            },
            "32": {
                "compte": 191,
                "age": "32",
                "sexe": 1
            },
            "33": {
                "compte": 203,
                "age": "33",
                "sexe": 1
            },
            "34": {
                "compte": 230,
                "age": "34",
                "sexe": 1
            },
            "35": {
                "compte": 246,
                "age": "35",
                "sexe": 1
            },
            "36": {
                "compte": 268,
                "age": "36",
                "sexe": 1
            },
            "37": {
                "compte": 288,
                "age": "37",
                "sexe": 1
            },
            "38": {
                "compte": 268,
                "age": "38",
                "sexe": 1
            },
            "39": {
                "compte": 276,
                "age": "39",
                "sexe": 1
            },
            "40": {
                "compte": 322,
                "age": "40",
                "sexe": 1
            },
            "41": {
                "compte": 314,
                "age": "41",
                "sexe": 1
            },
            "42": {
                "compte": 319,
                "age": "42",
                "sexe": 1
            },
            "43": {
                "compte": 299,
                "age": "43",
                "sexe": 1
            },
            "44": {
                "compte": 273,
                "age": "44",
                "sexe": 1
            },
            "45": {
                "compte": 292,
                "age": "45",
                "sexe": 1
            },
            "46": {
                "compte": 262,
                "age": "46",
                "sexe": 1
            },
            "47": {
                "compte": 265,
                "age": "47",
                "sexe": 1
            },
            "48": {
                "compte": 238,
                "age": "48",
                "sexe": 1
            },
            "49": {
                "compte": 231,
                "age": "49",
                "sexe": 1
            },
            "50": {
                "compte": 222,
                "age": "50",
                "sexe": 1
            },
            "51": {
                "compte": 197,
                "age": "51",
                "sexe": 1
            },
            "52": {
                "compte": 201,
                "age": "52",
                "sexe": 1
            },
            "53": {
                "compte": 188,
                "age": "53",
                "sexe": 1
            },
            "54": {
                "compte": 191,
                "age": "54",
                "sexe": 1
            },
            "55": {
                "compte": 166,
                "age": "55",
                "sexe": 1
            },
            "56": {
                "compte": 159,
                "age": "56",
                "sexe": 1
            },
            "57": {
                "compte": 135,
                "age": "57",
                "sexe": 1
            },
            "58": {
                "compte": 130,
                "age": "58",
                "sexe": 1
            },
            "59": {
                "compte": 120,
                "age": "59",
                "sexe": 1
            },
            "60": {
                "compte": 25,
                "age": "60",
                "sexe": 1
            },
            "61": {
                "compte": 6,
                "age": "61",
                "sexe": 1
            },
            "62": {
                "compte": "1",
                "age": "62",
                "sexe": "1"
            },
            "63": {
                "compte": "3",
                "age": "63",
                "sexe": "1"
            },
            "64": {
                "compte": 1,
                "age": "64",
                "sexe": 1
            },
            "65": {
                "compte": "3",
                "age": "65",
                "sexe": "1"
            },
            "66": {
                "compte": "1",
                "age": "66",
                "sexe": "1"
            },
            "68": {
                "compte": 0,
                "age": "68",
                "sexe": 1
            }
        }];
        const structure_title = 'ACCTDP';

        const Refuses = Object.values(data[1]);
        const Valides = Object.values(data[0]);
        const RefusesMef = Object.values(dataMef[0]);
        const ValidesMef = Object.values(dataMef[1]);  

        const barChartData = {
            labels: Refuses.map(val=>val.Mois).reverse(),
            datasets: [{
                label: "Validé",
                backgroundColor: "#3765b0",
                data: Valides.map(val=>-Number(val.Nombre)).reverse(),
            }, {
                label: "Refusé",
                backgroundColor: "#d41111",
                data: Refuses.map(val=>Number(val.Nombre)).reverse(),
            }],
        };

        const barChartDataMef = {
            labels: RefusesMef.map(val=>val.age).reverse(),
            datasets: [{
                label: "Validé",
                backgroundColor: "#d41111",
                data: ValidesMef.map(val=>-Number(val.compte)).reverse(),
            }, {
                label: "Refusé",
                backgroundColor: "#3765b0",
                data: RefusesMef.map(val=>Number(val.compte)).reverse(),
            }],
        };

        const commonXAxesOptions = {
            ticks: {
                beginAtZero: true,
                callback: function(value) {
                    return Math.abs(value);
                    // Retourne la valeur absolue
                }
            }
        };

        new Chart(ctx,{
            type: "horizontalBar",
            data: barChartData,
            options: {
                scales: {
                    xAxes: [commonXAxesOptions],
                    yAxes: [{
                        ticks: {
                            reverse: true,
                            callback: function(value, index, values) {
                                return index % 4 === 0 ? Math.abs(value) : null;
                            }
                        },
                        barPercentage: 2.5,
                        categoryPercentage: 0.5
                    }]
                },
                legend: {
                    labels: {
                        usePointStyle: true // Utiliser des icônes personnalisées
                    }
                }
            }
        });

        new Chart(ctxMef,{
            type: "horizontalBar",
            data: barChartDataMef,
            options: {
                scales: {
                    xAxes: [commonXAxesOptions],
                    yAxes: [{
                        ticks: {
                            reverse: true,
                            callback: function(value, index, values) {
                                return index % 4 === 0 ? value : null;
                            }
                        },
                        barPercentage: 2.5,
                        categoryPercentage: 1.0
                    }]
                },
                legend: {
                    labels: {
                        usePointStyle: true // Utiliser des icônes personnalisées
                    }
                }
            }
        });
    </script>
    
</div>
</div>
