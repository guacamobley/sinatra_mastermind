
function toggleCheckedClass(e)
{
  label = e.target
  toggleLabelBorder(label)
}

function toggleLabelBorder(label){
  matchingRadio = document.getElementById(label.attributes["data-id"].value)
  labels = document.getElementsByClassName("label")
  radiosToCheck = document.getElementsByTagName("input")
  for (radio of radiosToCheck){
    if (radio.type == "radio" && radio.attributes["data-radioclass"].value == label.attributes["data-radioclass"].value){
       //this is just the 6 radio buttons we care about
       labelToCheck = document.getElementById(`label${radio.id}`)

       if (radio.id == matchingRadio.id){
        labelToCheck.classList.add("label-checked")
        //do nothing. it's already checked
       } else{
        labelToCheck.classList.remove("label-checked")
       }
    }
    //if (radio.id == label.attributes["data-id"].value

  }
}


labels = document.getElementsByTagName("label")

for (label of labels){
  label.addEventListener("click",toggleCheckedClass)
  if (label.classList.contains("Black")){
    toggleLabelBorder(label)
  }
}


