try {
    const converter = new showdown.Converter();
    fetch('instructions.md').then(function(response) {
        response.text().then(function(markdown){
            document.querySelector('.tp-content').innerHTML = converter.makeHtml(markdown);
        });
    });
} catch(err){
    console.log(err);
}