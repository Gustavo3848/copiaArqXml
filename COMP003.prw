//±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
//±±º  PROGRAMA: COMP003                         		       			    º±±
//±±º     AUTOR: GUSTAVO BOVOLLATO           								º±±
//±±º      DATA: 04/05/2023               									º±±
//±±º DESCRIÇÃO: Copia arquivo XML para pasta monitorada Protheus Data	    º±±		   
//±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
User function COMP003()
	Local oLido
	Local cName := ""
	Local cReplace := ""
	Local cError := ""
	Local cWarning := ""
	Local cTitle := "Adicionar XML"
	Local targetDir:= TFileDialog("Xml(*.xml)",'Arquivos',0,"/tmp",.F.)
    Local cDirImp := "\importadorxml\inn\"
	IF !EMPTY(targetDir)
		oLido := XmlParser( memoRead(targetDir), cReplace, cError, cWarning)
		cName := oLido:_NFEPROC:_PROTNFE:_INFPROT:_CHNFE:TEXT + ".xml"
		IF !EMPTY(cError)
			FWAlertError(cError,cTitle)
			return
		ELSEIF !EMPTY(cWarning)
			FWAlertWarning(cWarning, cTitle)
		ENDIF
		__CopyFile(targetDir, cDirImp + cName )
		FWAlertSuccess("XML adicionado com sucesso!", cTitle)
	ENDIF
return
