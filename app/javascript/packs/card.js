const pay = () => {
  const payjp = Payjp('pk_test_cc9d9466df32fdd26a8c358d');
  const elements = payjp.elements();




  
  const numberElement = elements.create('cardNumber');
  const expElement = elements.create('cardExpiry');
  // const expmonth = expElement.month;
  // const expyear = expElement.year;
  const cvcElement = elements.create('cardCvc');
  

  numberElement.mount('#number-form');


  expElement.mount('#expiry-form');
  // expElement.mount('#card-exp-month');
  // expElement.mount('#card-exp-year');
  cvcElement.mount('#cvc-form');

  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);