function calc() {

  
  const price = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")


  price.addEventListener('keyup', function(){

    const price_value = price.value;
    const Fee = price_value * 0.1
    const Profit = price_value - Fee

    fee.textContent = Fee;
    profit.textContent = Profit;

  // fee.addEventListener('keyup', function(){
    // document.write(Fee);
  // })
  // profit.addEventListener('keyup',function(){
    // document.write(Profit)
  // })
 })
}
window.addEventListener("load", calc)