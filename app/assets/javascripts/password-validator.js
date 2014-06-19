PasswordValidator = {
  listenTo: function(tag, withSubmitBtn){
    tag.keyup(function(){
      if (PasswordValidator._isDirty(tag)){
       PasswordValidator._validate(tag, withSubmitBtn);
      }
    });
  },

  _validate: function(tag, submit){
    var passwordLength = tag.val().length
    if (passwordLength == 0){
      this.displayErrorMessage('empty'); 
      submit.attr('disabled', 'disabled');
    } 

    if (passwordLength > 0 && passwordLength < 6) {
      this.displayErrorMessage('tooShort');
      submit.attr('disabled', 'disabled');
    }

    if (passwordLength >= 6){
      submit.removeAttr('disabled');
    }
  },

  _isDirty: function(tag){
    var fieldInput = tag.val();
    if (fieldInput.length > 0) {
      return true
    } else {
      return false
    }
  },

  displayErrorMessage: function(errorType){
    console.log(this.errorMessages[errorType]);
  },

  errorMessages: {
    "empty": "Password can't be blank",
    "tooShort": "Password must be at least 6 characters"
  },
};
