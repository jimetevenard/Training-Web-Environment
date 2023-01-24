(function(){

    const COLLAPSED_ATTR = 'data-collapsed';
    const WRAPPER = 'main-wrapper';
    const BUTTON = 'btn-repli';

    const LABEL_REPLI = 'Replier';
    const LABEL_DEPLI = 'Déplier';

    const URL_PREFIX_CLASS = '.env-url-prefix';

    const TOC_CLASS = 'toc-generale';

    function repli(){
        let wrap = document.getElementById(WRAPPER);

        if(wrap.getAttribute(COLLAPSED_ATTR) === true.toString()){
            wrap.setAttribute(COLLAPSED_ATTR, false.toString());
            document.getElementById(BUTTON).innerText = LABEL_REPLI;
        } else {
            wrap.setAttribute(COLLAPSED_ATTR, true.toString());
            document.getElementById(BUTTON).innerText = LABEL_DEPLI;
        }
    }


    document.getElementById(BUTTON).addEventListener('click', repli);



    document.querySelectorAll(URL_PREFIX_CLASS).forEach(element => {
        element.innerText = location.origin +  element.innerText;
    });

    const toc = document.createElement('ul');
    toc.classList.add(TOC_CLASS);
    document.querySelectorAll('h2').forEach(h2Element => {
        const anchorName = encodeURI(h2Element.innerText);
        h2Element.id = anchorName;

        const newTocItem = document.createElement('li');
        const newTocLink = document.createElement('a');
        newTocLink.innerText = h2Element.innerText;
        newTocLink.setAttribute('href', `#${anchorName}`);
        newTocItem.appendChild(newTocLink);
        toc.appendChild(newTocItem);
    });
    document.querySelector('h1')?.insertAdjacentElement('afterend', toc);
})();

