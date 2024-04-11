$(function() {
    $('body').hide();
    window.addEventListener('message', function(event) {
        var data = event.data;
        if (data.action == 'showui') {
        $('body').fadeIn();
        $('.cash').html(event.data.cash);
        $('.name').html(event.data.name);
        $('.time').html(event.data.date);
        } else {
            $('body').hide();
        }
    });
})


$('#btn').click(function() {
    $.post("https://RdkShop/close", JSON.stringify({}))
    $("body").fadeOut(500);
})



function water() {
    $.post('https://RdkShop/water', JSON.stringify({}))
    var sound = new Audio('sound/sound.mp3');
    sound.volume = 0.5;
    sound.play();
}

function bread() {
    $.post('https://RdkShop/bread', JSON.stringify({}))
     var sound = new Audio('sound/sound.mp3');
     sound.volume = 0.5;
     sound.play();
}



function closemenu() {
    $.post('https://RdkShop/closemenu', JSON.stringify({}));
    $("body").fadeOut();
    var sound = new Audio('sound/popupreverse.mp3');
         sound.volume = 0.5;
         sound.play();
}

