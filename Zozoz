<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>مُذكِّر — تذكير بالمواعيد</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700;900&family=IBM+Plex+Mono:wght@500&display=swap');

  :root{
    --ink:#1c1b1a;
    --paper:#f6f2ec;
    --brass:#8a6d3b;
    --brass-deep:#5f4b28;
    --line:#d8cdb8;
    --accent:#2f5d50;
    --accent-soft:#e4efe9;
    --danger:#a33d2c;
    --shadow: 0 10px 30px rgba(28,27,26,.08);
  }

  *{box-sizing:border-box;}
  html,body{margin:0;padding:0;}
  body{
    background:var(--paper);
    color:var(--ink);
    font-family:'Tajawal', sans-serif;
    min-height:100vh;
    background-image:
      radial-gradient(circle at 15% 10%, rgba(138,109,59,.06), transparent 40%),
      radial-gradient(circle at 90% 80%, rgba(47,93,80,.07), transparent 40%);
  }

  header{
    text-align:center;
    padding:38px 20px 22px;
    border-bottom:1px solid var(--line);
  }
  header .eyebrow{
    font-family:'IBM Plex Mono', monospace;
    font-size:12px;
    letter-spacing:.15em;
    color:var(--brass-deep);
    text-transform:uppercase;
  }
  header h1{
    font-size:42px;
    font-weight:900;
    margin:6px 0 4px;
    letter-spacing:-.01em;
  }
  header p{
    margin:0;
    color:#6b6459;
    font-size:15px;
  }
  #clock{
    font-family:'IBM Plex Mono', monospace;
    font-size:15px;
    color:var(--brass-deep);
    margin-top:10px;
    direction:ltr;
    display:inline-block;
  }

  main{
    max-width:720px;
    margin:0 auto;
    padding:28px 18px 80px;
  }

  .card{
    background:#fffdf9;
    border:1px solid var(--line);
    border-radius:14px;
    box-shadow:var(--shadow);
    padding:22px;
    margin-bottom:24px;
  }

  form{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:14px;
  }
  form .full{grid-column:1/-1;}

  label{
    display:block;
    font-size:13px;
    color:#6b6459;
    margin-bottom:6px;
    font-weight:500;
  }
  input, select{
    width:100%;
    padding:11px 12px;
    border:1px solid var(--line);
    border-radius:9px;
    background:#fff;
    font-family:'Tajawal', sans-serif;
    font-size:15px;
    color:var(--ink);
  }
  input:focus, select:focus, button:focus{
    outline:3px solid var(--accent-soft);
    outline-offset:1px;
    border-color:var(--accent);
  }

  button{
    cursor:pointer;
    border:none;
    border-radius:9px;
    font-family:'Tajawal', sans-serif;
    font-weight:700;
    font-size:15px;
    transition:transform .12s ease, opacity .12s ease;
  }
  button:active{transform:scale(.98);}

  .btn-primary{
    grid-column:1/-1;
    background:var(--accent);
    color:#fff;
    padding:13px;
    margin-top:4px;
  }
  .btn-primary:hover{opacity:.92;}

  #status{
    font-size:13px;
    color:var(--brass-deep);
    margin-top:8px;
    min-height:18px;
  }

  .section-title{
    font-family:'IBM Plex Mono', monospace;
    font-size:12px;
    letter-spacing:.12em;
    text-transform:uppercase;
    color:var(--brass-deep);
    margin:0 0 14px;
    display:flex;
    align-items:center;
    gap:10px;
  }
  .section-title::after{
    content:"";
    flex:1;
    height:1px;
    background:var(--line);
  }

  .appt{
    display:flex;
    align-items:center;
    gap:14px;
    padding:14px 4px;
    border-bottom:1px solid var(--line);
  }
  .appt:last-child{border-bottom:none;}
  .appt .time{
    font-family:'IBM Plex Mono', monospace;
    font-weight:500;
    font-size:16px;
    color:var(--accent);
    min-width:64px;
    direction:ltr;
    text-align:center;
  }
  .appt .info{flex:1;}
  .appt .info .title{font-weight:700; font-size:15.5px;}
  .appt .info .date{font-size:12.5px; color:#8a8378; margin-top:2px;}
  .appt.due{
    background:linear-gradient(90deg, rgba(163,61,44,.06), transparent);
    border-radius:8px;
  }
  .appt.due .time{color:var(--danger);}

  .appt button.del{
    background:transparent;
    color:#b3aca0;
    font-size:20px;
    padding:4px 8px;
    line-height:1;
  }
  .appt button.del:hover{color:var(--danger);}

  .empty{
    text-align:center;
    color:#9a9284;
    font-size:14px;
    padding:30px 10px;
  }

  footer{
    text-align:center;
    font-size:12.5px;
    color:#9a9284;
    padding:20px;
  }

  @media (max-width:520px){
    form{grid-template-columns:1fr;}
    header h1{font-size:32px;}
  }

  @media (prefers-reduced-motion: reduce){
    *{transition:none !important;}
  }
</style>
</head>
<body>

<header>
  <div class="eyebrow">تذكير · تنظيم · التزام</div>
  <h1>مُذكِّر</h1>
  <p>أضف مواعيدك، وسيقوم المتصفح بتنبيهك في الوقت المحدد</p>
  <div id="clock">--:--:--</div>
</header>

<main>
  <div class="card">
    <p class="section-title">موعد جديد</p>
    <form id="form">
      <div class="full">
        <label for="title">عنوان الموعد</label>
        <input type="text" id="title" placeholder="مثال: اجتماع الفريق" required>
      </div>
      <div>
        <label for="date">التاريخ</label>
        <input type="date" id="date" required>
      </div>
      <div>
        <label for="time">الوقت</label>
        <input type="time" id="time" required>
      </div>
      <div class="full">
        <label for="repeat">التكرار</label>
        <select id="repeat">
          <option value="none">مرة واحدة</option>
          <option value="daily">يوميًا</option>
          <option value="weekly">أسبوعيًا</option>
        </select>
      </div>
      <button type="submit" class="btn-primary">حفظ الموعد</button>
      <div class="full" id="status"></div>
    </form>
  </div>

  <div class="card">
    <p class="section-title">المواعيد القادمة</p>
    <div id="list"></div>
  </div>
</main>

<footer>يعمل هذا التطبيق بالكامل داخل متصفحك — بياناتك محفوظة محليًا فقط</footer>

<audio id="alarmSound" preload="auto"
  src="data:audio/wav;base64,UklGRl9vT19XQVZFZm10IBAAAAABAAEAQB8AAEAfAAABAAgAZGF0YQAAAAA="></audio>

<script>
  const STORAGE_KEY = 'mothakkir_appointments_v1';
  const form = document.getElementById('form');
  const list = document.getElementById('list');
  const statusEl = document.getElementById('status');
  const clockEl = document.getElementById('clock');
  const alarmSound = document.getElementById('alarmSound');

  let appointments = JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]');
  let notifiedNow = new Set();

  function save(){
    localStorage.setItem(STORAGE_KEY, JSON.stringify(appointments));
  }

  function requestNotifyPermission(){
    if('Notification' in window && Notification.permission === 'default'){
      Notification.requestPermission();
    }
  }
  requestNotifyPermission();

  function fireAlert(appt){
    try{ alarmSound.play().catch(()=>{}); }catch(e){}

    if('Notification' in window && Notification.permission === 'granted'){
      new Notification('⏰ حان وقت الموعد', { body: appt.title, tag: appt.id });
    } else {
      alert('⏰ حان وقت الموعد: ' + appt.title);
    }
  }

  function nextOccurrence(appt){
    // returns a Date object for the next time this appt should fire
    return new Date(appt.date + 'T' + appt.time);
  }

  function advanceRepeating(appt){
    const d = nextOccurrence(appt);
    if(appt.repeat === 'daily'){
      d.setDate(d.getDate() + 1);
    } else if(appt.repeat === 'weekly'){
      d.setDate(d.getDate() + 7);
    }
    appt.date = d.toISOString().split('T')[0];
  }

  function checkDue(){
    const now = new Date();
    let changed = false;
    appointments.forEach(appt => {
      const occ = nextOccurrence(appt);
      const key = appt.id + '|' + occ.getTime();
      if(occ <= now && !notifiedNow.has(key)){
        notifiedNow.add(key);
        fireAlert(appt);
        if(appt.repeat !== 'none'){
          advanceRepeating(appt);
          changed = true;
        }
      }
    });
    if(changed){ save(); render(); }
  }

  function fmtDate(dstr){
    const d = new Date(dstr + 'T00:00:00');
    return d.toLocaleDateString('ar-EG', { weekday:'long', day:'numeric', month:'long' });
  }

  function render(){
    appointments.sort((a,b) => nextOccurrence(a) - nextOccurrence(b));
    if(appointments.length === 0){
      list.innerHTML = '<div class="empty">لا توجد مواعيد بعد — أضف موعدك الأول أعلاه</div>';
      return;
    }
    const now = new Date();
    list.innerHTML = appointments.map(appt => {
      const occ = nextOccurrence(appt);
      const isDue = occ <= now;
      const repeatLabel = appt.repeat === 'daily' ? ' · يوميًا' : appt.repeat === 'weekly' ? ' · أسبوعيًا' : '';
      return `
        <div class="appt ${isDue ? 'due' : ''}">
          <div class="time">${appt.time}</div>
          <div class="info">
            <div class="title">${escapeHtml(appt.title)}</div>
            <div class="date">${fmtDate(appt.date)}${repeatLabel}</div>
          </div>
          <button class="del" data-id="${appt.id}" title="حذف">×</button>
        </div>`;
    }).join('');

    list.querySelectorAll('.del').forEach(btn => {
      btn.addEventListener('click', () => {
        appointments = appointments.filter(a => a.id !== btn.dataset.id);
        save();
        render();
      });
    });
  }

  function escapeHtml(s){
    const d = document.createElement('div');
    d.textContent = s;
    return d.innerHTML;
  }

  form.addEventListener('submit', e => {
    e.preventDefault();
    const title = document.getElementById('title').value.trim();
    const date = document.getElementById('date').value;
    const time = document.getElementById('time').value;
    const repeat = document.getElementById('repeat').value;
    if(!title || !date || !time) return;

    appointments.push({
      id: Date.now().toString(36) + Math.random().toString(36).slice(2),
      title, date, time, repeat
    });
    save();
    render();
    form.reset();
    statusEl.textContent = '✓ تم حفظ الموعد بنجاح';
    setTimeout(() => statusEl.textContent = '', 2500);
  });

  function tickClock(){
    clockEl.textContent = new Date().toLocaleTimeString('ar-EG', { hour12:false });
  }

  render();
  tickClock();
  setInterval(tickClock, 1000);
  setInterval(checkDue, 1000);
</script>
</body>
</html>
