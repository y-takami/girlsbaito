$(document).on 'page:change', ->
  $('form.edit_shop_info').on 'click', '#enable-password-field', ->
    $('#enable-password-field').hide()
    $('#disable-password-field').show()
    $('#shop_info_password').removeAttr('disabled')
    $('label[for=shop_info_password]').addClass('required')
  $('form.edit_shop_info').on 'click', '#disable-password-field', ->
    $('#disable-password-field').hide()
    $('#enable-password-field').show()
    $('#shop_info_password').attr('disabled', 'disabled')
    $('label[for=shop_info_password]').removeClass('required')
