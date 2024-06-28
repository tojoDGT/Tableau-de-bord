jQuery(document).ready(function() {
    jQuery.when($.pageLoader()).done(
        function(){
                /*jQuery.when(setTimeout(function(){ jQuery('.animBoxIndex').fadeOut(500)},2000)).done(
                    setTimeout(function(){ jQuery('.animateinHome').fadeIn(1000)},2500)
                );*/
				jQuery.when(setTimeout(function(){ jQuery('.animBoxIndex').fadeOut(1)},1)).done(
                    setTimeout(function(){ jQuery('.animateinHome').fadeIn(1)},1)
                );
    });
    var passbtn = jQuery('.resetPass'),
        inscrbtn = jQuery('.signUp'),
        signinbtn = jQuery('.showSignIn'),
        FormSingIn = jQuery('form.form-signin'),
        FormSingUp = jQuery('form.form-signup'),
        FormPass = jQuery('form.form-pass');

        passbtn.on('click',function(){
            $.when(FormSingIn.addClass('animate')).done(function(){
                setTimeout(function(){
                    FormSingIn.removeClass('show').removeClass('animate').addClass('hide');
                    FormPass.removeClass('hide').addClass('show');
                },600);
            });
        });
        inscrbtn.on('click',function(){
            $.when(FormSingIn.addClass('animate')).done(function(){
                setTimeout(function(){
                    FormSingIn.removeClass('show').removeClass('animate').addClass('hide');
                    FormSingUp.removeClass('hide').addClass('show');
                },600);
            });
        });
        signinbtn.on('click',function(){
            $.when(jQuery('form.form-signup, form.form-pass').addClass('animate')).done(function(){
                setTimeout(function(){
                    FormSingUp.removeClass('show').removeClass('animate').addClass('hide');
                    FormPass.removeClass('show').removeClass('animate').addClass('hide');
                    FormSingIn.removeClass('hide').addClass('show');
                },600);
            });
        });
});

