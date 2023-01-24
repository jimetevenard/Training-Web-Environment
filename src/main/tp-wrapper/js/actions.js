var glop;

(function(){

    const COLLAPSED_ATTR = 'data-collapsed';
    const WRAPPER = 'main-wrapper';
    const BUTTON = 'btn-repli';

    const LABEL_REPLI = 'Replier';
    const LABEL_DEPLI = 'Déplier';

    const URL_PREFIX_CLASS = '.env-url-prefix';

    const TOC_CLASS = 'toc-generale';

    const PREFIX_LINKS_TO_MENU = '#editor::menu::';



    // Repli du panneau latéral
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



    // Remplacement de l'URL dans les éléments ad-hoc
    document.querySelectorAll(URL_PREFIX_CLASS).forEach(element => {
        element.innerText = location.origin +  element.innerText;
    });



    // TOC
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


    // Liens vers les éléments de menu
    document.querySelectorAll('aside a').forEach(linkElement => {
        const href = linkElement.getAttribute('href');

        if(href?.startsWith(PREFIX_LINKS_TO_MENU)){
            linkElement.addEventListener('click', e => {
                e.preventDefault();

                const menuArray = href.substring(PREFIX_LINKS_TO_MENU.length).split('/');
                vscodeHelper.overLightMenu(menuArray);
            });
        }
    })



})();

