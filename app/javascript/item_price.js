window.addEventListener('load', function(){
  const taxCalculation = this.document.getElementById("item-price")

  taxCalculation.addEventListener('input', function(){
    const inputValue = taxCalculation.value;
    const addTax = document.getElementById("add-tax-price")
    const addProfit = document.getElementById("profit")
    addTax.innerHTML = Math.floor(inputValue * 0.10)
    addProfit.innerHTML = Math.floor(inputValue - (Math.floor(inputValue * 0.10)))
  })
})