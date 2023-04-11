window.addEventListener('load', () => {


const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxPrice = document.getElementById("add-tax-price");
  const price = parseInt(priceInput.value); 
  const tax = Math.floor(price * 0.1); 
  const result = tax;
  addTaxPrice.innerHTML = result

  const profit = document.getElementById("profit");
  const profitValue = Math.floor(price - tax);
  profit.innerHTML = profitValue;
  });
  });