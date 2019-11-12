var initVoice = function(){
    if (annyang){
        var bigger = 1;
        Shiny.onInputChange("title", "Say title something");
        Shiny.onInputChange("color", "green");
        Shiny.onInputChange("bigger", 1);
        Shiny.onInputChange("yes", "no");
        
        // Define commands ----
        var commands = {
            // title function 
            "title *title" : function(title){
                Shiny.onInputChange("title", title);
            },
            // color function
            "color :color" : function(color){
                Shiny.onInputChange("color", color);
            },
            // bigger size function
            "bigger" : function(){
                bigger += 1;
                Shiny.onInputChange("bigger", bigger);
            },
            // smaller size function
            "smaller" : function(){
                if (bigger >= 1.5){
                    bigger -= 1;
                    Shiny.onInputChange("bigger", bigger);
                }
            },
            // regression function
            "regression" : function(){
                Shiny.onInputChange("yes", Math.random());
            }
        };
        
        // Adding GUI
        // // Tell KITT to use annyang
        // SpeechKITT.annyang();
        
        // // Define a stylesheet for KITT to use
        // SpeechKITT.setStylesheet('//cdnjs.cloudflare.com/ajax/libs/SpeechKITT/0.3.0/themes/flat.css');
        
        // // Render KITT's interface
        // SpeechKITT.vroom();
        
        // Add commands to annyang
        annyang.addCommands(commands);
        // Start listening
        annyang.start();
    }
};

$(function(){
    setTimeout(initVoice, 10);
});