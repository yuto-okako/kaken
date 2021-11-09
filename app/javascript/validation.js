$(document).on('turbolinks:load', function() {
  $(document).off('blur', '.js-name-field');
  $(document).on('blur', '.js-name-field', function() {
    checkName(); 
    console.log('ddd');
  });
  
  $(document).off('blur', '.js-mail-field');
  $(document).on('blur.mail', '.js-mail-field', function(e) {
    checkMail(e);
    console.log('ccc');
  });
  
  $(document).off('blur', '.js-password-field');
  $(document).on('blur', '.js-password-field', function() {
    checkPassword(); 
  });
  
  $(document).off('blur', '.js-conf-field');
  $(document).on('blur', '.js-conf-field', function() {
    checkConf();
  });
  
  $(document).off('click', '.js-form-btn');
  $(document).on('click', '.js-form-btn', function(e) {
    let flag = true;
    if(!checkName()) {
      flag = false;
    }
    if(!checkMail(e)) {
      flag = false;
    }
    if(!checkPassword()) {
      flag = false;
    }
    if(!checkConf()) {
      flag = false;
    }
    console.log('bbb');
    if(!flag) {
      return false;
    }
  });
});

function checkName() {
  $('.js-name-error').empty();
  let name = $.trim($('.js-name-field').val());
  let flag = true;
    
  if(name.match(/^[\r\n\t]*$/)) {
    $('.js-name-error').append('名前は必須項目です。');
    flag = false;
  }
  return flag;
}

function checkMail(e) {
  e.preventDefault();           //イベントハンドラによるリクエスト + Ajaxリクエストの二重送信防止
  $('.js-mail-error').empty();
  let mail = $.trim($('.js-mail-field').val());
  let flag = true;

  if(mail.match(/^[\r\n\t]*$/)) {
    $('.js-mail-error').append('メールアドレスは必須項目です。');
    flag = false;
  } else if(!mail.includes('@')) {
    $('.js-mail-error').append('"@"を含めてください。');
    flag = false;
  } else {
    $('.js-form-btn').prop('disabled', true); //submitボタンを非活性化(多重送信防止)
    $.ajax({
      type: 'GET',              //GETでリクエスト
      url: '/mails/searches',   //参照先URL
      data: {mail: mail},       //送信データ {相手で使うパラメータ: 送信データ}
      dataType: 'json'          //レスポンスされるデータ型
    })
    .done(function(data) {      //data : レスポンスされたデータ
      if(!data) {
        $('.js-mail-error').append('このメールアドレスは登録済みです。');
        flag = false;
        $('.js-form-btn').prop('disabled', false);
      }
    });
  }
  return flag;
}

function checkPassword() {
  $('.js-password-error').empty();
  let pass = $.trim($('.js-password-field').val());
  let flag = true;
    
  if(pass.match(/^[\r\n\t]*$/)) {
    $('.js-password-error').append('パスワードは必須項目です。');
    flag = false;
  } else {
    if($('.js-conf-field').val() !== '') {
      checkConf();
    }
  }
  return flag;
}

function checkConf() {
  $('.js-conf-error').empty();
  let pass = $('.js-password-field').val();
  let conf = $('.js-conf-field').val();
  let flag = true;
  
  if(conf !== pass) {
    $('.js-conf-error').append('パスワードが一致しません。');
    flag = false;
  }
  return flag;
}