
$('select#congratulation_method').change(function () {
    var selectval = $('select#congratulation_method option:selected').text();
    if (selectval == '銀行振込') {
        $('#bank_name').show();
        $('#bank_branch_name').show();
        $('#bank_type').show();
        $('#bank_number').show();

        $('#postal_code').hide();
        $('#prefecture').hide();
        $('#city').hide();
        $('#house_number').hide();
    }
    if (selectval == 'アマゾンギフトカード') {
        $('#postal_code').show();
        $('#prefecture').show();
        $('#city').show();
        $('#house_number').show();

        $('#bank_name').hide();
        $('#bank_branch_name').hide();
        $('#bank_type').hide();
        $('#bank_number').hide();
    }
    if (selectval == 'iTunesカード') {
        $('#postal_code').show();
        $('#prefecture').show();
        $('#city').show();
        $('#house_number').show();

        $('#bank_name').hide();
        $('#bank_branch_name').hide();
        $('#bank_type').hide();
        $('#bank_number').hide();
    }
})
;

$(function (){
    var selectval = $('select#congratulation_method option:selected').text();

    if (selectval == '銀行振込') {
        $('#bank_name').show();
        $('#bank_branch_name').show();
        $('#bank_type').show();
        $('#bank_number').show();

        $('#postal_code').hide();
        $('#prefecture').hide();
        $('#city').hide();
        $('#house_number').hide();
    }
    if (selectval == 'アマゾンギフトカード') {
        $('#postal_code').show();
        $('#prefecture').show();
        $('#city').show();
        $('#house_number').show();

        $('#bank_name').hide();
        $('#bank_branch_name').hide();
        $('#bank_type').hide();
        $('#bank_number').hide();
    }
    if (selectval == 'iTunesカード') {
        $('#postal_code').show();
        $('#prefecture').show();
        $('#city').show();
        $('#house_number').show();

        $('#bank_name').hide();
        $('#bank_branch_name').hide();
        $('#bank_type').hide();
        $('#bank_number').hide();
    }
})
;