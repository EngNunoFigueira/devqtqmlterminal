var periodOfDay = "M";
var pageOneChangeColor = 1;
var pageTwoChangeColor = 1;
var getServiceType;
var nmbrOffOperationsRequested = 0;
var serverIpAddress = deviceConfig.getServerIpAddress();

var ticket = {
id_:"",
counter:"",
code: "",
status: "",
serviceType: "",
openTime: "",
closeTime:""
}

function pageNavigator()
{
    if(pageOne.visible == true) {
       pageOne.visible=false
       pageTwo.visible=true

    }
    else  if(pageTwo.visible == true){
        pageOne.visible=true
        pageTwo.visible=false
    }
}

function applicationInfo() {

    console.log("Application_Name: agenda médica terminal")
    console.log("Application_version: 1.0.0")
    console.log("Application_author: nundelTech 2020")

    deviceConfig.setTerminalConfig()
    console.log("IP-ADDRESS :" + deviceConfig.getServerIpAddress())
    console.log("GPS-LT : " + deviceConfig.getGSPlt())
    console.log("GPS-LG :" + deviceConfig.getGSPlg())
    console.log("STATUS :" + deviceConfig.getTerminalStatus())


}
function showPrintOptions()
{
    root.color="black"
    layoutButtons.visible=false
    printOptions.visible=true
    timer.interval=9000
    timer.running=true
}
function gotoHomeMenu()
{
    root.color="#182825"
    layoutButtons.visible=true
    printOptions.visible=false
    getTickePhoto.visible=false
}
function printingTicket()
{
  console.log("PAPER TICKET");
  codeGenerator();
}
function showNowTicket()
{
  console.log("SCREEN TIKECT PICTURE");
  //codeGenerator
  ticketCode.text=codeGenerator();
  printDatetime.text= getTime.getDateTime();
  getTickePhoto.visible=true;
}

function toggleButtonBoderColor()
{
  //if(pageOne.visible == true) {
    if(pageOneChangeColor===1){
      attgeral.border.color="#A9FBD7"
      goToPageTwo.border.color="#39393A"
      attLabel.color= '#A9FBD7'
      pageTwoLabel.color= 'black'
      resultados.border.color="#A9FBD7"
      resultadosLabel.color='#A9FBD7'
      nextPage.border.color= "#39393A"
      pageTwoText.color='black'
      pageOneChangeColor=2
    }
    else if(pageOneChangeColor===2) {
        attgeral.border.color="#39393A"
        consulta.border.color="#A9FBD7"
        consultaLabel.color= '#A9FBD7'
        attLabel.color= 'black'
        resultados.border.color="#39393A"
        resultadosLabel.color='black'
        visita.border.color="#A9FBD7"
        visitaLabel.color='#A9FBD7'
        pageOneChangeColor=3
    }
    else if(pageOneChangeColor===3){
        consulta.border.color="#39393A"
        exame.border.color="#A9FBD7"
        exameLabel.color= '#A9FBD7'
        consultaLabel.color= 'black'
        visita.border.color="#39393A"
        visitaLabel.color='black'
        revisao.border.color="#A9FBD7"
        revisaoLabel.color='#A9FBD7'
        pageOneChangeColor=4
      }
    else if(pageOneChangeColor===4){
        exame.border.color="#39393A"
        goToPageTwo.border.color="#A9FBD7"
        exameLabel.color= 'black'
        pageTwoLabel.color= '#A9FBD7'
        revisao.border.color="#39393A"
        revisaoLabel.color='black'
        nextPage.border.color="#A9FBD7"
        pageTwoText.color='#A9FBD7'
        pageOneChangeColor=1
      }
}

function getQtCoreDateTime()
{
    //console.log("this is the time get from Qt C++ " + getTime.getDateTime())
}
function codeGenerator(){

    switch(getServiceType) {
        case "Att Geral":
            return "AG"+ nmbrOffOperationsRequested + periodOfDay
        case "Consulta":
            return "CS"+ nmbrOffOperationsRequested + periodOfDay
        case "Exame Medico":
            return "XM"+ nmbrOffOperationsRequested + periodOfDay
        case "Visita":
            return "VT"+ nmbrOffOperationsRequested + periodOfDay
        case "Resultados":
            return "RS"+ nmbrOffOperationsRequested + periodOfDay
        case "Revisao":
            return "RV"+ nmbrOffOperationsRequested + periodOfDay
        default:
            return "--"+ nmbrOffOperationsRequested + periodOfDay
    }
}

function createTicket()
{
    var ticket={
        code: codeGenerator(),
        counter:nmbrOffOperationsRequested,
        serviceType:getServiceType,
        status: "waiting",
        openTime:getTime.getDateTime(),
        closeTime:""
    }
}

function apiPostTicket()
{
  ticket={
        _id:"",
        counter:nmbrOffOperationsRequested,
        code: codeGenerator(),
        status: "waiting",
        serviceType:getServiceType,
        openTime:getTime.getDateTime(),
        closeTime:""
    }

 var json = JSON.stringify(ticket)
 // const url="http://10.10.10.90:5000/registers/"
 const url="http://"+serverIpAddress+":5000/registers/"
 var request = new XMLHttpRequest();
 request.open("POST", url, true);
 request.setRequestHeader('Content-type', 'application/json; charset=UTF-8');
 request.onload = function () {
                 if (request.readyState === 4 && request.status === "200")
                  { console.table(request.responseText); }
                 else
                  { console.error(request.responseText); }
              }
 request.send(json);
}
