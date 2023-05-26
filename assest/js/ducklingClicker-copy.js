//vars
var quacks = 0;
var perSecond = 0;
let inventory = [0, 0, 0, 0, 0, 0];
let quacksProduction = [0.1, 2, 4, 6, 8, 10];
let itemPrice = [10, 200, 400, 600, 800, 10000];
var FPS = 30;
let quantity = 1;
//Functios

function clic() {
    quacks++;



}

function guisantes() {
    /*   cantidadguisantes > 10
           mejora1= true
           clicksPerSecond de guisantes * 2; */
}

function clicksPerSecond() {
    quacks += perSecond;
}

function changeMode(number) {
    if (number == 1) {
        document.getElementById("storeBulkSell").setAttribute("class", "storeBulkMode active");
        document.getElementById("storeBulkBuy").setAttribute("class", "storeBulkMode");
    } else {
        document.getElementById("storeBulkBuy").setAttribute("class", "storeBulkMode active");
        document.getElementById("storeBulkSell").setAttribute("class", "storeBulkMode");
    }
}

function changeQuantity(number) {
    if (number == 1) {
        document.getElementById("storeBulk1").setAttribute("class", "storeBulkAmount")
        document.getElementById("storeBulk10").setAttribute("class", "storeBulkAmount active")
        document.getElementById("storeBulk100").setAttribute("class", "storeBulkAmount")
    } else if (number == 2) {
        document.getElementById("storeBulk1").setAttribute("class", "storeBulkAmount")
        document.getElementById("storeBulk10").setAttribute("class", "storeBulkAmount")
        document.getElementById("storeBulk100").setAttribute("class", "storeBulkAmount active")
    } else {
        document.getElementById("storeBulk1").setAttribute("class", "storeBulkAmount active")
        document.getElementById("storeBulk10").setAttribute("class", "storeBulkAmount")
        document.getElementById("storeBulk100").setAttribute("class", "storeBulkAmount")
    }
}

function buy(item) {
    if (quacks >= itemPrice[item]) {
        inventory[item] += quantity;
        perSecond += quacksProduction[item];
        quacks -= itemPrice[item];
        itemPrice[item] *= 2;
    }
}

function sell(item) {
    inventory[item] -= quantity;
    perSecond -= clicksPerSecond[item];
}


function productOwneds() {
    for (let i = 0; i < inventory.length; i++) {
        document.getElementById('producOwned' + i).innerHTML = inventory[i];
    }
}

function productPrices() {
    for (let i = 0; i < itemPrice.length; i++) {
        document.getElementById('productPrice' + i).innerHTML = `${itemPrice[i]} quacks`;
    }
}

function render() {
    document.getElementById("number").innerHTML = `${Math.trunc(quacks)} quacks`;
    document.getElementById("clicksPerSecond").innerHTML = `Por segundo: ${perSecond.toFixed(1)} quacks`;
    productOwneds();
    clicksPerSecond();
    productPrices();
}

setInterval(() => {
    render();
}, 3000 / FPS)