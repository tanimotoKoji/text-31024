
window.addEventListener("DOMContentLoaded", function(){
  const btn = document.querySelector('.buy-btn');
  const buyAlert = function(){
    swal('購入処理が完了しました')
  };
  btn.addEventListener('click',buyAlert);
});

