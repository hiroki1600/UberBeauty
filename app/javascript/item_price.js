window.addEventListener('load', () =>{
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.15);
  const saleProfit = document.getElementById("profit");
    saleProfit.innerHTML = Math.ceil(inputValue - (inputValue * 0.1));
  })
});