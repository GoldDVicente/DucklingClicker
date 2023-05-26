/* VARIABLES */
const FPS = 30;
const INCREMENT = 1.25;
let perSecond = [];
let user;
let quantity = 1;
let items = [];
let inventory = [];
let upgrades = [];
let achievements = [];

//
let ducklingsPerSecond = document.getElementById("ducklingsPerSecond");
let ducklings = document.getElementById("number");

/* STORE */
let storeBulkSell = document.getElementById("storeBulkSell");
let storeBulkBuy = document.getElementById("storeBulkBuy");
let storeBulk1 = document.getElementById("storeBulk1");
let storeBulk10 = document.getElementById("storeBulk10");
let storeBulk100 = document.getElementById("storeBulk100");
let products = document.getElementById("products");

//
function setDucklingsPerClick() {
  let quacks = 1;
  user.ducklings += quacks;
}

function setDucklings() {
  user.ducklings += getDucklingsPerSecond();
}

function getDucklingsPerSecond() {
  let aux = 0;
  for (let i = 1; i < perSecond.length; i++)
    aux += perSecond[i];

  return aux;
}

function setDucklingsPerSecond(item) {
  perSecond[item.id_item] = item.quantity > 0 ? (item.quantity * item.production) : 0;
}

function getItemPrice(item) {
  return Math.ceil(item.price + (item.price * ((item.quantity + quantity - 1) * INCREMENT)));
}

//LOAD VALUES
function loadUser(id) {
  $.ajax({
    url: "http://localhost/clickerPHP/user/" + id,
    method: "GET",
    success: (result) => {
      user = JSON.parse(result).texto[0];
      user.ducklings = parseFloat(user.ducklings);
    },
    errorr: (result) => { },
  });
}

function createProduct(item) {
  let product, icon, img, content, name, price, owned;

  product = document.createElement("div");
  product.setAttribute("class", "product");
  product.setAttribute("id", "product" + item.id_item);
  product.addEventListener("click", () => buy(item.id_item));

  icon = document.createElement("div");
  icon.setAttribute("class", "icon");
  icon.setAttribute("id", "productIcon" + item.id_item);

  img = document.createElement("img");
  img.setAttribute("src", "assest/media/item/" + item.image);

  content = document.createElement("div");
  content.setAttribute("class", "content");

  name = document.createElement("div");
  name.setAttribute("class", "productName");
  name.setAttribute("id", "productName" + item.id_item);
  name.innerText = item.name;

  price = document.createElement("div");
  price.setAttribute("class", "price");
  price.setAttribute("id", "productPrice" + item.id_item);
  price.innerText = item.price;

  owned = document.createElement("div");
  owned.setAttribute("class", "owned");
  owned.setAttribute("id", "productOwned" + item.id_item);
  owned.innerText = item.quantity;

  icon.appendChild(img);

  content.appendChild(name);
  content.appendChild(price);

  product.appendChild(icon);
  product.appendChild(content);
  product.appendChild(owned);

  return product;
}

function loaditems(id) {
  $.ajax({
    url: "http://localhost/clickerPHP/userItem/" + id,
    method: "GET",
    success: (result) => {

      items = JSON.parse(result).texto;
      items[0].price = parseInt(items[0].price);
      items[0].production = parseFloat(items[0].production);
      items[0].quantity = parseInt(items[0].quantity);

      for (let i = 1; i < items.length; i++) {
        items[i].price = parseInt(items[i].price);
        items[i].production = parseFloat(items[i].production);
        items[i].quantity = parseInt(items[i].quantity);
        products.appendChild(createProduct(items[i]));
        setDucklingsPerSecond(items[i]);
      }
    },
  });
}

function loadupgrades() { }

function loadAchievements() { }

function loadValues() {
  let id = sessionStorage.getItem("id");
  loadUser(id);
  loaditems(id);
  loadupgrades(id);
  loadAchievements();
}

//GAME


function changeMode(number) {
  if (number == 1) {
    storeBulkSell.setAttribute("class", "storeBulkMode active");
    storeBulkBuy.setAttribute("class", "storeBulkMode");
  } else {
    storeBulkBuy.setAttribute("class", "storeBulkMode active");
    storeBulkSell.setAttribute("class", "storeBulkMode");
  }
}

function changeQuantity(number) {
  if (number == 1) {
    storeBulk1.setAttribute("class", "storeBulkAmount");
    storeBulk10.setAttribute("class", "storeBulkAmount active");
    storeBulk100.setAttribute("class", "storeBulkAmount");
    quantity = 10;
  } else if (number == 2) {
    storeBulk1.setAttribute("class", "storeBulkAmount");
    storeBulk10.setAttribute("class", "storeBulkAmount");
    storeBulk100.setAttribute("class", "storeBulkAmount active");
    quantity = 100;
  } else {
    storeBulk1.setAttribute("class", "storeBulkAmount active");
    storeBulk10.setAttribute("class", "storeBulkAmount");
    storeBulk100.setAttribute("class", "storeBulkAmount");
    quantity = 1;
  }
}

function buy(id) {
  let itemPrice = getItemPrice(items[id]);

  if (user.ducklings >= itemPrice) {
    items[id].quantity += quantity;
    user.ducklings -= itemPrice;
    setDucklingsPerSecond(items[id]);
  }
}

function sell(item) {
  items[item].quantity -= quantity;
}

function productOwneds() {
  for (let i = 1; i < items.length; i++) {
    document.getElementById('productOwned' + i).innerText = items[i].quantity;
  }
}

function productPrices() {
  for (let i = 1; i < items.length; i++) {
    document.getElementById('productPrice' + i).innerText = `${getItemPrice(items[i])} quacks`;
  }
}
function render() {
  ducklings.innerText = `${Math.trunc(user.ducklings)} quacks`;
  ducklingsPerSecond.innerText = `Por segundo: ${getDucklingsPerSecond()} quacks`;
  productOwneds();
  productPrices();
  setDucklings();

}

setInterval(() => {
  render();
}, 3000 / FPS);

/* CREATE EVENTS */
window.onload = loadValues;

storeBulkBuy.addEventListener("click", () => changeMode(0));
storeBulkSell.addEventListener("click", () => changeMode(1));

storeBulk1.addEventListener("click", () => changeQuantity(0));
storeBulk10.addEventListener("click", () => changeQuantity(1));
storeBulk100.addEventListener("click", () => changeQuantity(2));

document.getElementById("elementClick").addEventListener("click", setDucklingsPerClick);
