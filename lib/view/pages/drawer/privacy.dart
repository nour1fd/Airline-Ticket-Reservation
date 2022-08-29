import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Police",style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w400
        ),),
        backgroundColor: Colors.white,
        elevation: 0.0,
        foregroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              Text("Data Controllers in the GDPR",
                style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold
              ),
              ),
              Text("The EU's data protection laws have changed a lot since 2011. Instead of the old Data Protection Directive privacy law, which was in force at the time, we now have the GDPR. But the relevant part of the law, the definition of a data controller,still applies."
"Under Article 4 (7) of the GDPR, a data controller is a person or organization who "
"determines the purposes and means of the processing of personal data."
"This means someone who decides why and how personal data is processed."
"And Article 26 of the GDPR uses the term joint controllers - "
"two or more controllers [who] jointly determine the purposes and means of processing."
"Joint controllers can decide between themselves who takes responsibility for complying with which of the various obligations under the GDPR and other privacy laws. They don't each need to comply with the whole law - so long as they have it all covered between them."
      "Some companies have put out statements or added sections to their Privacy Policy to explain how they process personal data jointly."

          "Soho Works,",style: TextStyle(
                color: Colors.black45,fontWeight: FontWeight.w500
              ),
              ),
              SizedBox(height: 30.0,),
              Text("Cookies and Page Insights",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text("Certain cookies are considered personal data under privacy law. This is because they can be used to identify individual visitors to a website."
" Another EU law, known as the ePrivacy Directive, has more to say about cookies than the GDPR. It states that they should only be used"
             "on condition that users are provided with clear and precise information [and are] made aware of information being placed on the terminal equipment they are using."")"
              ,style: TextStyle(
                    color: Colors.black45,fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 30.0,),
              Text("Page Admin's Joint Controller Duties",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),),
              Text("The best way to comply with the legal obligations that remain with you, as a Page admin, is to have a compliant Privacy Policy."

"              If you do have Privacy Policy, you need to make some changes to it."
"              If you don't yet have a Privacy Policy, it's very important that you create one."
              ,style: TextStyle(
                    color: Colors.black45,fontWeight: FontWeight.w500
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
