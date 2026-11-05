```html
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ياش اطعم 🍽️</title>

<style>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: Arial, sans-serif;
  background: #fff8ed;
  color: #3b2115;
}

header {
  background: linear-gradient(135deg, #8b2e16, #d65a20);
  color: white;
  text-align: center;
  padding: 35px 15px;
  border-bottom: 6px solid #f5b642;
}

.logo {
  font-size: 60px;
}

header h1 {
  font-size: 48px;
}

header p {
  font-size: 18px;
  margin-top: 8px;
}

.welcome {
  text-align: center;
  padding: 30px 15px 10px;
}

.welcome h2 {
  color: #9e3518;
  font-size: 30px;
}

.menu {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 22px;
  padding: 30px;
  max-width: 1100px;
  margin: auto;
}

.card {
  background: white;
  border-radius: 22px;
  padding: 25px 18px;
  text-align: center;
  box-shadow: 0 5px 20px #0002;
  border: 2px solid #f7dfc0;
  transition: 0.3s;
}

.card:hover {
  transform: translateY(-7px);
}

.food {
  font-size: 70px;
}

.card h3 {
  color: #8b2e16;
  font-size: 23px;
  margin-top: 10px;
}

.card p {
  color: #76594b;
  margin: 8px 0;
}

.price {
  color: #d65a20;
  font-size: 22px;
  font-weight: bold;
  margin: 12px;
}

button {
  background: #d65a20;
  color: white;
  border: none;
  padding: 12px 25px;
  border-radius: 30px;
  cursor: pointer;
  font-size: 16px;
  font-weight: bold;
}

button:hover {
  background: #8b2e16;
}

.cart,
.payment-box {
  max-width: 650px;
  margin: 25px auto;
  padding: 28px;
  background: white;
  border-radius: 22px;
  box-shadow: 0 5px 20px #0002;
  border: 2px solid #f7dfc0;
}

.cart h2,
.payment-box h2 {
  text-align: center;
  color: #8b2e16;
  margin-bottom: 15px;
}

#cartItems {
  line-height: 2;
  margin: 15px 0;
}

.total {
  text-align: center;
  font-size: 23px;
  color: #d65a20;
  font-weight: bold;
  margin: 15px;
}

.order-btn {
  display: block;
  margin: auto;
}

.payment-box {
  display: none;
}

.payment-box p {
  text-align: center;
  color: #76594b;
  margin-bottom: 18px;
}

.payment-box input {
  width: 100%;
  padding: 14px;
  margin: 7px 0;
  border: 2px solid #ead7c2;
  border-radius: 12px;
  font-size: 16px;
  outline: none;
}

.payment-box input:focus {
  border-color: #d65a20;
}

.card-row {
  display: flex;
  gap: 10px;
}

.card-row input {
  width: 50%;
}

.pay-button {
  width: 100%;
  margin-top: 15px;
}

.success {
  display: none;
  text-align: center;
  padding: 25px;
  background: #e9f8e9;
  border: 2px solid #72b572;
  border-radius: 18px;
  color: #246324;
  margin-top: 20px;
}

footer {
  background: #3b2115;
  color: white;
  text-align: center;
  padding: 25px;
  margin-top: 40px;
}

footer strong {
  color: #f5b642;
}

@media (max-width: 500px) {
  header h1 {
    font-size: 36px;
  }

  .menu {
    padding: 18px;
  }
}
</style>
</head>

<body>

<header>
  <div class="logo">🍽️</div>
  <h1>ياش اطعم</h1>
  <p>أكل بيتي... بطعم يخليك تقول يا سلام! 😋</p>
</header>

<section class="welcome">
  <h2>🍴 منيو ياش اطعم</h2>
  <p>اختار أكلك المفضل واستمتع بأحلى طعم ❤️</p>
</section>

<section class="menu">

  <div class="card">
    <div class="food">🍚</div>
    <h3>كُشري</h3>
    <p>كشري مصري لذيذ بالبصل والدقة</p>
    <div class="price">25 ريال</div>
    <button onclick="addToCart('كُشري',25)">
      أضف للسلة 🛒
    </button>
  </div>

  <div class="card">
    <div class="food">🍮</div>
    <h3>أرز بلبن</h3>
    <p>أرز بلبن كريمي وحلو</p>
    <div class="price">10 ريال</div>
    <button onclick="addToCart('أرز بلبن',10)">
      أضف للسلة 🛒
    </button>
  </div>

  <div class="card">
    <div class="food">🍟</div>
    <h3>بطاطس</h3>
    <p>بطاطس ذهبية ومقرمشة</p>
    <div class="price">8 ريال</div>
    <button onclick="addToCart('بطاطس',8)">
      أضف للسلة 🛒
    </button>
  </div>

  <div class="card">
    <div class="food">🌴</div>
    <h3>تمر</h3>
    <p>تمر فاخر وحلو المذاق</p>
    <div class="price">12 ريال</div>
    <button onclick="addToCart('تمر',12)">
      أضف للسلة 🛒
    </button>
  </div>

  <div class="card">
    <div class="food">💧</div>
    <h3>ماء</h3>
    <p>ماء بارد ومنعش</p>
    <div class="price">2 ريال</div>
    <button onclick="addToCart('ماء',2)">
      أضف للسلة 🛒
    </button>
  </div>

  <div class="card">
    <div class="food">🥛</div>
    <h3>لبن</h3>
    <p>لبن بارد ومنعش</p>
    <div class="price">5 ريال</div>
    <button onclick="addToCart('لبن',5)">
      أضف للسلة 🛒
    </button>
  </div>

</section>

<!-- CART -->
<section class="cart">

  <h2>🛒 سلة طلباتك</h2>

  <div id="cartItems">
    السلة فارغة حاليًا 😋
  </div>

  <div class="total">
    الإجمالي:
    <span id="total">0</span>
    ريال
  </div>

  <button class="order-btn" onclick="placeOrder()">
    تأكيد الطلب 📦
  </button>

</section>


<!-- CARD INFORMATION -->
<section class="payment-box" id="paymentBox">

  <h2>💳 معلومات البطاقة</h2>

  <p>
    أدخل معلومات الدفع لإكمال طلبك
  </p>

  <input
    type="text"
    id="cardName"
    placeholder="الاسم على البطاقة"
  >

  <input
    type="text"
    id="cardNumber"
    placeholder="رقم البطاقة"
    maxlength="19"
    inputmode="numeric"
  >

  <div class="card-row">

    <input
      type="text"
      id="expiry"
      placeholder="MM/YY"
      maxlength="5"
      inputmode="numeric"
    >

    <input
      type="password"
      id="cvv"
      placeholder="CVV"
      maxlength="4"
      inputmode="numeric"
    >

  </div>

  <button class="pay-button" onclick="payNow()">
    💳 دفع الآن
  </button>

  <div class="success" id="success">
    <h2>🎉 تم الطلب بنجاح!</h2>
    <p>
      شكراً لاختيارك <strong>ياش اطعم</strong> ❤️
    </p>
    <p>
      إجمالي طلبك:
      <strong id="successTotal">0</strong>
      ريال
    </p>
  </div>

</section>


<footer>
  <p>
    © 2026 <strong>ياش اطعم</strong>
  </p>
  <p>
    كل لقمة فيها حكاية ❤️
  </p>
</footer>


<script>

let cart = [];
let total = 0;


// ADD FOOD
function addToCart(name, price) {

  cart.push({
    name: name,
    price: price
  });

  total += price;

  updateCart();
}


// UPDATE CART
function updateCart() {

  const items = document.getElementById("cartItems");

  if (cart.length === 0) {

    items.innerHTML =
      "السلة فارغة حاليًا 😋";

  } else {

    items.innerHTML = cart.map(
      (item, index) =>

      `${index + 1}. ${item.name}
      - ${item.price} ريال`

    ).join("<br>");

  }

  document.getElementById("total").textContent = total;
}


// CONFIRM ORDER
function placeOrder() {

  if (cart.length === 0) {

    alert("⚠️ أضف أكلاً إلى السلة أولاً 😋");
    return;

  }

  const paymentBox =
    document.getElementById("paymentBox");

  paymentBox.style.display = "block";

  paymentBox.scrollIntoView({
    behavior: "smooth"
  });

}


// PAY
function payNow() {

  const name =
    document.getElementById("cardName").value.trim();

  const number =
    document.getElementById("cardNumber").value.trim();

  const expiry =
    document.getElementById("expiry").value.trim();

  const cvv =
    document.getElementById("cvv").value.trim();


  if (
    !name ||
    !number ||
    !expiry ||
    !cvv
  ) {

    alert(
      "⚠️ من فضلك أكمل جميع معلومات البطاقة"
    );

    return;
  }


  // Demo only
  document.getElementById(
    "successTotal"
  ).textContent = total;

  document.getElementById(
    "success"
  ).style.display = "block";


  alert(
    "🎉 تم استلام طلبك من ياش اطعم!\n" +
    "الإجمالي: " + total + " ريال ❤️"
  );

}

</script>

</body>
</html>
```
