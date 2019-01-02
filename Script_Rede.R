# Script Arquivo de Rede
# Golden Care V/VI
# Criado por Roberto Schneider
#
# 27/12/2018


#Define o diretório
setwd("G:/#Roberto/-R")

#Definindo as variáveis
origem <- "03SCRE_I_CREDEN_ZU34_BR_SUPERIOR_EMPRESA_20190101_2306.txt"
saida <-  paste("OK",origem,sep="_")
saida <- gsub(".txt","",saida)
saida <- paste(saida ,"csv",sep=".")
#Ajusta nome do produto
nome_produto <- paste((strsplit(origem, split="_")[[1]])[6],(strsplit(origem, split="_")[[1]])[7],sep=" ")
if((strsplit(origem, split="_")[[1]])[6] == "GOLDEN FIT"){
	nome_produto <- "GOLDEN FIT"
}
if((strsplit(origem, split="_")[[1]])[6] == "GOLDEN CARE HOSP"){
	nome_produto <- "GOLDEN CARE HOSP"
}
if((strsplit(origem, split="_")[[1]])[6] == "SELECT"){
	nome_produto <- "SELECT"
}
if((strsplit(origem, split="_")[[1]])[6] == "PLENA"){
	nome_produto <- "PLENA"
}
if(nome_produto == "SUPERIOR EMPRESA"){
	nome_produto <- "EXECUTIVO"
}


#Importa o arquivo txt (nome do arquivo, header false é arquivo sem cabeçalho, separado por ; , quote define o que é string)
rede_dataframe <- read.table(origem, header=FALSE, sep=";", quote ="") 

#Exibe o arquivo importado
#head(rede_dataframe) 

#Excluir colunas desnecessárias
rede_dataframe$V1 <- NULL
rede_dataframe$V13 <- NULL
rede_dataframe$V14 <- NULL
rede_dataframe$V17 <- NULL
rede_dataframe$V23 <- NULL

#Outra forma de excluir colunas
#rede_dataframe<-rede_dataframe[,-c(1,13,14,17,23)]

#Renomeia o cabeçalho no intervalo das colunas 1 a 18
names(rede_dataframe)[1:18] <- c("UF","Cidade","Tipo_Atendimento", "Especialidade", "Bairro","Nome","Endereço", "Tel_1", "Tel_X", "CPF_CNPJ", "Seq", "CEP", "Combinação", "Quarto","Enfermaria", "Produto", "CNPJ_CRM", "Website")

#Testa se o produto é Golden Care III, V ou VI
if(nome_produto == "GCARE V" || nome_produto == "GCARE VI" || nome_produto == "GCARE III" ){ 
	#Deixa apenas as linhas do RJ
	rede_dataframe <- subset(rede_dataframe, UF=="RJ")
	
	#Elimina as linhas com as localidades abaixo
	rede_dataframe <- subset(rede_dataframe, Cidade != "AREAL                     ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "ARRAIAL DO CABO           ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "CANTAGALO                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "ITAOCARA                  ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "JAPERI                    ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "MENDES                    ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "MIGUEL PEREIRA            ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "NATIVIDADE                ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "PARATY                    ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "PINHEIRAL                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "RIO CLARO                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "SAO PEDRO DA ALDEIA       ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "TANGUA                    ")
}

#Testa se o produto é Golden Care I
if(nome_produto == "GCARE EMPRESA" || nome_produto == "GOLDEN CARE HOSP"){ 
	#Deixa apenas as linhas do RJ
	rede_dataframe <- subset(rede_dataframe, UF=="RJ")
	
	#Elimina as linhas com as localidades abaixo
	#trecho GCARE III, V e VI
	rede_dataframe <- subset(rede_dataframe, Cidade != "AREAL                     ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "ARRAIAL DO CABO           ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "CANTAGALO                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "ITAOCARA                  ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "JAPERI                    ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "MENDES                    ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "MIGUEL PEREIRA            ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "NATIVIDADE                ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "PARATY                    ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "PINHEIRAL                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "RIO CLARO                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "SAO PEDRO DA ALDEIA       ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "TANGUA                    ")
	
	#trecho GCARE I
	rede_dataframe <- subset(rede_dataframe, Cidade != "ANGRA DOS REIS            ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "ARARUAMA                  ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "BARRA DO PIRAI            ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "BARRA MANSA               ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "BOM JESUS DO ITABAPOANA   ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "CABO FRIO                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "CACHOEIRAS DE MACACU      ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "CAMPOS DOS GOYTACAZES     ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "CORDEIRO                  ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "GUAPIMIRIM                ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "ITAGUAI                   ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "ITAPERUNA                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "ITATIAIA                  ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "MACAE                     ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "MARICA                    ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "PARAIBA DO SUL            ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "PIRAI                     ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "PORCIUNCULA               ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "RESENDE                   ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "RIO DAS OSTRAS            ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "SANTO ANTONIO DE PADUA    ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "SAO FIDELIS               ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "SAQUAREMA                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "SEROPEDICA                ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "VALENCA                   ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "VASSOURAS                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "VOLTA REDONDA             ")
}

#Testa se o produto é Golden Fit
if(nome_produto == "GOLDEN FIT"){ 
	#Deixa apenas as linhas do RJ
	rede_dataframe <- subset(rede_dataframe, UF=="RJ")
	
	#Elimina as linhas com as localidades abaixo
	rede_dataframe <- subset(rede_dataframe, Cidade != "CABO FRIO                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "CACHOEIRAS DE MACACU      ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "ITABORAI                  ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "MAGE                      ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "MARICA                    ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "NOVA FRIBURGO             ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "PARACAMBI                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "PETROPOLIS                ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "RIO DAS OSTRAS            ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "SEROPEDICA                ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "TANGUA                    ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "TERESOPOLIS               ")
}

#Testa se o produto é Select
if(nome_produto == "SELECT"){ 
	#Deixa apenas as linhas do RJ
	rede_dataframe <- subset(rede_dataframe, UF=="RJ")
	
	#Elimina as linhas com as localidades abaixo
	rede_dataframe <- subset(rede_dataframe, Cidade != "ANGRA DOS REIS            ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "ARARUAMA                  ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "BELFORD ROXO              ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "CABO FRIO                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "GUAPIMIRIM                ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "CABO FRIO                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "GUAPIMIRIM                ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "ITAGUAI                   ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "MACAE                     ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "PETROPOLIS                ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "QUEIMADOS                 ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "RESENDE                   ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "TERESOPOLIS               ")
	rede_dataframe <- subset(rede_dataframe, Cidade != "VOLTA REDONDA             ")
}

#Substituindo os valores das colunas Quarto e Enfermaria
rede_dataframe$Quarto[rede_dataframe$Quarto > 0] <- "X"
rede_dataframe$Quarto[rede_dataframe$Quarto == 0] <- ""

rede_dataframe$Enfermaria[rede_dataframe$Enfermaria > 0] <- "X"
rede_dataframe$Enfermaria[rede_dataframe$Enfermaria == 0] <- ""

if(nome_produto == "EXECUTIVO"){
	#Excluir coluna de Enfermaria
	rede_dataframe$Enfermaria <- NULL
}

#Substituindo os valores da coluna Produto
rede_dataframe$Produto[rede_dataframe$Produto == 0] <- nome_produto

#Substituindo os valores das coluna Tipo_Atendimento
rede_dataframe$Tipo_Atendimento[rede_dataframe$Tipo_Atendimento == 1] <- "1 - ESP. MÉDICA - CONSULTA"
rede_dataframe$Tipo_Atendimento[rede_dataframe$Tipo_Atendimento == 2] <- "2 - HOSPITAL"
rede_dataframe$Tipo_Atendimento[rede_dataframe$Tipo_Atendimento == 3] <- "3 - CLÍNICA ESPECIALIZADA"
rede_dataframe$Tipo_Atendimento[rede_dataframe$Tipo_Atendimento == 4] <- "4 - LABORATÓRIO"
rede_dataframe$Tipo_Atendimento[rede_dataframe$Tipo_Atendimento == 5] <- "5 - SERV. ESPECIALIZADO"
rede_dataframe$Tipo_Atendimento[rede_dataframe$Tipo_Atendimento == 6] <- "6 - PRONTO SOCORRO"

#head(rede_dataframe)

#Exporta para CSV
write.csv2(rede_dataframe, saida,  row.names = FALSE)