#include "FiveWin.ch"

FUNCTION Main()

   local oXPath := TMiniXPath():New( "https://www.nfce.fazenda.sp.gov.br/NFCePortal/" )

   if oXPath:Analisar()
      ? "NFC-e ................:", If( oXPath:lDisponibilidadeNFCe, "Disponivel", "Indisponivel" )
      ? "Contingencia EPEC ....:", If( oXPath:lDisponibilidadeEPEC, "Disponivel", "Indisponivel" )

      if oXPath:lDisponibilidadeNFCe
         MsgInfo( "Servico NFC-e OPERANTE" )
      else
         MsgAlert( "Servico NFC-e INDISPONIVEL!" )
      endif
   else
      MsgStop( "Erro na consulta: " + oXPath:cErro )
   endif

return NIL

#include "TMiniXPath.class"
