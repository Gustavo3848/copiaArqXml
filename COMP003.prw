//北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
//北�  PROGRAMA: COMP003                         		       			    罕�
//北�     AUTOR: GUSTAVO BOVOLLATO           								罕�
//北�      DATA: 04/05/2023               									罕�
//北� DESCRI敲O: Copia arquivo XML para pasta monitorada Protheus Data	    罕�		   
//北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北北�
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
