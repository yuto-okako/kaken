$(document).on('turbolinks:load', function() {
  $(document).off('blur', '.js-name-field').on('blur', '.js-name-field', function() {
    checkName(); 
  });
  
  $(document).off('blur', '.js-mail-field').on('blur.mail', '.js-mail-field', function(e) {
    checkMail();
  });
  
  $(document).off('blur', '.js-password-field').on('blur', '.js-password-field', function() {
    checkPassword(); 
  });
  
  $(document).off('blur', '.js-conf-field').on('blur', '.js-conf-field', function() {
    checkConf();
  });
  
  $(document).off('click', '.js-form-btn').on('click', '.js-form-btn', function() {
    let flag = true;
    
    if($('.js-name-field').val() === '') {
      checkName();
    }
    if($('.js-mail-field').val() === '') {
      checkMail();
    }
    if($('.js-password-field').val() === '') {
      checkPassword();
    }
    if($('.js-conf-field').val() === '') {
      checkConf();
    }
    
    $('.error-msg').each(function() {
      if($(this).text() !== '') {
        flag = false;
      }
    });
    
    return flag;
  });
});

function checkName() {
  $('.js-name-error').empty();
  let name = $.trim($('.js-name-field').val());
    
  if(name.match(/^[\r\n\t]*$/)) {
    $('.js-name-error').append('名前は必須項目です。');
  }
}

function checkMail() {
  $('.js-mail-error').empty();
  let mail = $.trim($('.js-mail-field').val());

  if(mail.match(/^[\r\n\t]*$/)) {
    $('.js-mail-error').append('メールアドレスは必須項目です。');
  } else if(!mail.includes('@')) {
    $('.js-mail-error').append('"@"を含めてください。');
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
      }
    })
    .always(function() {
      $('.js-form-btn').prop('disabled', false);
    });
  }
}

function checkPassword() {
  $('.js-password-error').empty();
  let pass = $.trim($('.js-password-field').val());
    
  if(pass.match(/^[\r\n\t]*$/)) {
    $('.js-password-error').append('パスワードは必須項目です。');
  } else {
    if($('.js-conf-field').val() !== '') {
      checkConf();
    }
  }
}

function checkConf() {
  $('.js-conf-error').empty();
  let pass = $('.js-password-field').val();
  let conf = $('.js-conf-field').val();
  
  if(conf !== pass) {
    $('.js-conf-error').append('パスワードが一致しません。');
  }
}