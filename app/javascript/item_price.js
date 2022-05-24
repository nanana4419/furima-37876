window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    console.log(Math.floor(addTaxDom.innerHTML));
    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = inputValue - Math.floor(addTaxDom.innerHTML);
    console.log(Math.floor(salesProfit));
  })

});
