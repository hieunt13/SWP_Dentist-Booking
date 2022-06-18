/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

var selected1stServiceSlotCheck = false;
var selected2ndServiceSlotCheck = false;
function pickSlot(elm) {
    document.getElementById("errorMsg").style.display = "none";
    var slotUnavailable;
    var elm1stSlotShow = document.getElementById('1st-slot');
    var elm2ndSlotShow = document.getElementById('2nd-slot');
    var elm1stServiceShow = document.getElementById('1st-service');
    var elm2ndServiceShow = document.getElementById('2nd-service');
    var selectSlotElm = document.getElementById(elm.childNodes[1].innerText.charAt(elm.childNodes[1].innerText.length - 1));
    var selectSlotElm2nd = document.getElementById('slot-' + elm.childNodes[1].innerText.charAt(elm.childNodes[1].innerText.length - 1));
    var valueInputDate = document.querySelector("#date").childNodes[1].value;
    var timeOfSlot = elm.childNodes[4].innerText;

    for (let j = 1; j < 7; j++) {
        if (document.getElementById('slot-' + j).selected) {
            selected2ndServiceSlotCheck = document.getElementById('slot-' + j).selected;
        }
    }
    for (let j = 1; j < 7; j++) {
        if (document.getElementById(j).selected) {
            selected1stServiceSlotCheck = document.getElementById(j).selected;
        }
    }
    if (elm.classList[1] == "selected") {
        if (timeOfSlot == valueInputDate && (selectSlotElm.selected == true || selectSlotElm2nd.selected == true)) {
            var elmSlot = elm.childNodes[1].innerText.substring(0, 6);
            if (selectSlotElm.label == elmSlot && selectSlotElm.selected == true) {
                selectSlotElm.selected = false;
                selected1stServiceSlotCheck = false;
                elm1stServiceShow.style.display = "none";
                elm1stSlotShow.innerText = 'Choose service';
                elm1stSlotShow.selected = "true";
                if (!selected2ndServiceSlotCheck) {
                    document.querySelector("#date").childNodes[1].value = "";
                }
                document.querySelector("#alert").style.display = "none";
                elm.removeAttribute("style");
                document.getElementById("1stService").removeAttribute("required");
                document.getElementById("1stServiceSlot").removeAttribute("required");
                return;
            } else {
                selectSlotElm2nd.selected = false;
                selected2ndServiceSlotCheck = false;
                elm2ndSlotShow.innerText = 'Choose service';
                elm2ndSlotShow.selected = "true";
                elm2ndServiceShow.style.display = "none";
                if (!selected1stServiceSlotCheck) {
                    document.querySelector("#date").childNodes[1].value = "";
                }
                document.querySelector("#alert").style.display = "none";
                elm.removeAttribute("style");
                document.getElementById("2ndService").removeAttribute("required");
            }

        } else if (timeOfSlot == valueInputDate || valueInputDate == "") {
            if (selected2ndServiceSlotCheck == false || selected1stServiceSlotCheck == false) {
                var selectedCheck = false;
                var selectedCheck2nd = false;
                for (let j = 1; j < 7; j++) {
                    if (document.getElementById(j).selected) {
                        selectedCheck = true;
                    }
                    if (document.getElementById('slot-' + j).selected) {
                        selectedCheck2nd = true;
                    }
                    if (selectedCheck == true && selectSlotElm2nd.selected == false) {
                        selectSlotElm2nd.selected = "true";
                        elm2ndServiceShow.style.display = "block";
                        document.getElementById("2ndService").setAttribute('required', 'required');
                        elm2ndSlotShow.innerText = 'Choose service for slot ' + elm.childNodes[1].innerText.charAt(elm.childNodes[1].innerText.length - 1);
                        elm.style.backgroundColor = "red";
                        return;
                    }
                    if (selectedCheck2nd == true && selectedCheck == false) {
                        document.getElementById(elm.childNodes[1].innerText.charAt(elm.childNodes[1].innerText.length - 1)).selected = "true";
                        elm1stServiceShow.style.display = "block";
                        elm1stSlotShow.innerText = 'Choose service for slot ' + elm.childNodes[1].innerText.charAt(elm.childNodes[1].innerText.length - 1);
                        document.querySelector("#date").childNodes[1].value = elm.childNodes[4].innerText;
                        elm.style.backgroundColor = "red";
                        return;
                    }
                }
            }
            if (selected2ndServiceSlotCheck == false && selected1stServiceSlotCheck == false) {
                document.getElementById(elm.childNodes[1].innerText.charAt(elm.childNodes[1].innerText.length - 1)).selected = "true";
                elm1stServiceShow.style.display = "block";
                elm1stSlotShow.innerText = 'Choose service for slot ' + elm.childNodes[1].innerText.charAt(elm.childNodes[1].innerText.length - 1);
                document.querySelector("#date").childNodes[1].value = elm.childNodes[4].innerText;
                elm.style.backgroundColor = "red";
            }
        }
    }
}

function resetPickSlot(collection) {
    for (let i = 0; i < collection.length; i++) {
        if (collection[i].style.backgroundColor == "red") {
            collection[i].removeAttribute("style");
        }
        var valueInputDate = document.querySelector("#date").childNodes[1].value;
        var timeOfSlot = collection[i].childNodes[4].innerText;
        var selectSlotElm = document.getElementById(collection[i].childNodes[1].innerText.charAt(collection[i].childNodes[1].innerText.length - 1));
        var selectSlotElm2nd = document.getElementById('slot-' + collection[i].childNodes[1].innerText.charAt(collection[i].childNodes[1].innerText.length - 1));
        if (valueInputDate === timeOfSlot && (selectSlotElm.selected === true || selectSlotElm2nd.selected === true)) {
            collection[i].style.backgroundColor = "red";
        }

    }
}
function handleSelect(elm)
{
    window.location = "booking?dentistId=" + elm.value;
}
function myValidation()
{
    var service1stElm = document.getElementById("1stService").options[document.getElementById("1stService").selectedIndex].text;
    var service2ndElm = document.getElementById("2ndService").options[document.getElementById("2ndService").selectedIndex].text;

    if (service1stElm == service2ndElm)
    {
        document.getElementById("alert").style.display = "block";

        return false;
    }
    console.log(document.getElementById("book"));
    document.getElementById("book").submit();
}
function checkError() {
    for (let j = 1; j < 7; j++) {
        if (document.getElementById('slot-' + j).selected) {
            selected2ndServiceSlotCheck = document.getElementById('slot-' + j).selected;
        }
    }
    for (let j = 1; j < 7; j++) {
        if (document.getElementById(j).selected) {
            selected1stServiceSlotCheck = document.getElementById(j).selected;
        }
    }
    if (selected2ndServiceSlotCheck == false && selected1stServiceSlotCheck == false) {
        document.getElementById("errorMsg").style.display = "block";
    }
}
const Calendar = function () {
    let current = new Date();
    const moveToMonday = (increment) => {
        let round = 0;
        while (current.getDay() != 0 || (round < 2 && increment < 0)) {
            current = new Date(current.getFullYear(), current.getMonth(), current.getDate() + (increment || -1));
            if (current.getDay() == 0)
                round++;
        }
    }
    const getWeek = (step = 1) => {
        const increment = step == 0 ? step : step / Math.abs(step);
        moveToMonday(increment);
        let week = [];
        while (week.length < 7) {
            const day = new Date(current.getFullYear(), current.getMonth(), current.getDate() + 1);
            current = day;
            week.push(current);
        }
        return week;
    }
    return {
        getWeek
    }
}

const cal = new Calendar();


var months = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"];
var daysOfWeekLetters = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

var today = new Date();
const create = (days) => {
    let dayOfWeek = document.querySelectorAll(".day-of-week");
    let slotDate = document.querySelectorAll(".slotDate");
    let array = document.querySelectorAll(".slot-date");
    var z = 6;
    var i = 0;
    var x = 0;
    days.forEach((day) => {
        for (i; i < z; i++) {
            slotDate[i].innerHTML = day.getDate() + '/' + (day.getMonth() + 1) + '/' + day.getFullYear();
        }
        z = z + 6;
        dayOfWeek[x].innerHTML = daysOfWeekLetters[day.getDay()];
        array[x].innerHTML = day.getDate() + ' ' + months[day.getMonth()] + ' ' + day.getFullYear();
        if (today.getDate() == day.getDate() && today.getMonth() == day.getMonth() && today.getFullYear() == day.getFullYear()) {
            array[x].style.borderRadius = "0px 0px 10px 10px";
            array[x].style.backgroundColor = "#09e5ab";
            array[x].style.color = "white";
            dayOfWeek[x].style.backgroundColor = "#09e5ab";
            dayOfWeek[x].style.color = "white";
            dayOfWeek[x].style.borderRadius = "10px 10px 0px 0px";
        } else {
            array[x].style.borderRadius = "0px 0px 0px 0px";
            array[x].style.backgroundColor = "white";
            dayOfWeek[x].style.backgroundColor = "white";
            dayOfWeek[x].style.borderRadius = "0px 0px 0px 0px";
            array[x].style.color = "#757575";
            dayOfWeek[x].style.color = "#757575";
        }
        x++;
    })
}

document.getElementById('next').addEventListener('click', (e) => {
    create(cal.getWeek(1));
    recoveryAvailableSlot(collection);
    checkSlotAvailable(collection);
    resetPickSlot(collection);
})

document.getElementById('prev').addEventListener('click', (e) => {
    create(cal.getWeek(-1));
    recoveryAvailableSlot(collection);
    checkSlotAvailable(collection);
    resetPickSlot(collection);
})

const collection = document.querySelectorAll(".timing.selected");
const recoveryAvailableSlot = function (collection) {
    for (let i = 0; i < collection.length; i++) {
        collection[i].classList.add("selected");
    }
}
const checkSlotAvailable = function (collection) {
    var list_slot_booked = document.querySelectorAll(".slotUnavailable");
    var list_slotDate_booked = document.querySelectorAll(".meeting_date");
    console.log(list_slot_booked);
    console.log(list_slotDate_booked);
    for (let i = 0; i < collection.length; i++) {
        var timeOfSlot = collection[i].childNodes[4].innerText;
        var dateString = collection[i].childNodes[4].innerText; // Oct 23

        var timeOfSlotDate = dateString.split("/");

        // month is 0-based, that's why we need dataParts[1] - 1
        var dateObject = new Date(+timeOfSlotDate[2], timeOfSlotDate[1] - 1, +timeOfSlotDate[0]);
        var slot = collection[i].childNodes[1].innerText;
        for (let j = 0; j < list_slot_booked.length; j++) {
            if (dateObject < today) {
                collection[i].classList.remove("selected");
            }
            if (timeOfSlot == list_slotDate_booked[j].innerText && slot == list_slot_booked[j].innerText) {
                collection[i].classList.remove("selected");
            }
        }
        console.log(collection[i]);
        console.log(collection[i].classList);
    }
}
create(cal.getWeek(0));
recoveryAvailableSlot(collection);
checkSlotAvailable(collection);
