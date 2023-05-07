init()
{
    //gametype started

    // example of shorthand struct initialization
    level.tutorial = 
    {
        #hello: "hello world!",
        #var: "Skipped!",
        #arrayShorthand: [#"hashkey":"value 1", 1:"value 2", 2:"value 3"],
        #arrayVariadic: array("value 1", "value 2", "value 3")
    };
    
}