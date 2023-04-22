(function(){

    const COLLAPSED_ATTR = 'data-collapsed';
    const WRAPPER = 'main-wrapper';
    const BUTTON = 'btn-repli';

    function repli(){
        let wrap = document.getElementById(WRAPPER);

        if(wrap.getAttribute(COLLAPSED_ATTR) === true.toString()){
            wrap.setAttribute(COLLAPSED_ATTR, false.toString())
        } else {
            wrap.setAttribute(COLLAPSED_ATTR, true.toString())
        }
    }


    document.getElementById(BUTTON).addEventListener('click', repli);
})();

