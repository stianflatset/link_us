import 'package:nfc_manager/nfc_manager.dart';


void stoppNfc(){
  NfcManager.instance.stopSession();
}

// Skriver til annen nfc
void skrivNfc(){
  stoppNfc();

  NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async{
        Ndef ndef = Ndef.from(tag);
        // Sjekker om kan skrives til
        if (ndef == null || !ndef.isWritable){
          print("Ikke skrivbar");
          return;
        }

        NdefMessage message = NdefMessage([
          NdefRecord.createText("Mordi e mann")
        ]);

        try {
          await ndef.write(message);
          print("Haha yes");
          stoppNfc();
          return;
        }catch (e){
          print("Funket ikke " + e);
          stoppNfc();
        }
      });
}

// Leser fra nfc (Kontakt inn)
String lesNfc(){
  stoppNfc();
  NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
    //Printer ut nfc
    print("Data: "+ tag.data.toString());
    stoppNfc();
    return tag.data.toString();

  });

}
