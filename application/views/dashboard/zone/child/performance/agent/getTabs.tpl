<style>
/*body {
  background: #f69ec4;
  font-family: "Lato", sans-serif;
}

h2 {
  color: #000;
  text-align: center;
  font-size: 2em;
  margin: 20px 0;
}*/

.warpper {
  display: flex;
  flex-direction: column;
  /*background-color: rgba(0, 0, 0, .075);*/
  /*align-items: center;*/
}

tr.shown {
  background-color: rgba(0, 0, 0, .075);
}

.tab {
  cursor: pointer;
  padding: 10px 20px;
  margin: 0px 2px;
  background: #32557f;
  display: inline-block;
  color: #fff;
  border-radius: 3px 3px 0px 0px;
  box-shadow: 0 0.5rem 0.8rem #00000080;
}

.panels {
  background: #fff;
  box-shadow: 0 0.1rem 0.1rem #00000080;
  min-height: 200px;
  width: 100%;
  max-width: 500px;
  border-radius: 3px;
  overflow: hidden;
  padding: 20px;
}

.panel {
  display: none;
  animation: fadein 0.8s;
}

@keyframes fadein {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.panel-title {
  font-size: 1.5em;
  font-weight: bold;
}

.radio {
  display: none;
}

#one:checked ~ .panels #one-panel,
#two:checked ~ .panels #two-panel,
#three:checked ~ .panels #three-panel {
  display: block;
}

#one:checked ~ .tabs #one-tab,
#two:checked ~ .tabs #two-tab,
#three:checked ~ .tabs #three-tab {
  background: #fff;
  color: #000;
  border-top: 3px solid #32557f;
}

</style>
<div class="warpper">
  <input class="radio" id="one" name="group" type="radio" checked>
  <input class="radio" id="two" name="group" type="radio">
  <input class="radio" id="three" name="group" type="radio">

  <div class="tabs">
    <label class="tab" id="one-tab" for="one">Tab1</label>
    <label class="tab" id="two-tab" for="two">Tab2</label>
    <label class="tab" id="three-tab" for="three">Tab3</label>
  </div>

  <div class="panels">
    <div class="panel" id="one-panel">
      <div class="panel-title">Title1</div>
      <p>Content1</p>
    </div>
    <div class="panel" id="two-panel">
      <div class="panel-title">Title2</div>
      <p>Content2</p>
    </div>
    <div class="panel" id="three-panel">
      <div class="panel-title">Title3</div>
      <p>Content3</p>
    </div>
  </div>
</div>