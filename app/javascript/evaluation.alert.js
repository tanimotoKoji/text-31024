window.addEventListener("load", function(){
  const evBtn = document.querySelector('.evaluations-btn');
  const evAlert = function(){
    swal('投稿が完了しました')
  };
  evBtn.addEventListener('click',evAlert);
});