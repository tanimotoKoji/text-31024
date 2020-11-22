window.addEventListener('load',() => {
  const type = document.getElementById("pay_category[2]");
  type.addEventListener('click', () => {
    const price = document.getElementById("price-box");
    console.log(price);
    price.value = 0
  });
});