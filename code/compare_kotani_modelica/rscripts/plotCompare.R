#Author: Christopher Schölzel
phinames <- c("t","P","Phi","nu_b","nu_p","nu_s","CcNe","CvNe","r","R")
names(phinames) <- c(
  "time",
  "blood.vessel.pressure",
  "sinus.phase",
  "baro.signal.activation",
  "para.signal.activation",
  "symp.signal.activation",
  "cNeAmount.con.concentration",
  "vNeAmount.con.concentration",
  "lung.r",
  "lung.resp.phase"
)
compare.print.first <- function(phinames,dataMo,dataJ) {
  # Prints starting values for given variables and highlights differences
  # 
  # Args:
  #   phinames: (named) vector of variablenames found in dataJ; the names(phinames)
  #             must contain the name of the corresponding variable in dataMo
  #   dataMo: modelica data as matrix
  #   dataJ: java data as matrix
  for(moname in names(phinames)) {
    phiname = phinames[moname]
    moval = as.numeric(dataMo[1,moname])
    phival = dataJ[1,phiname]
    if(moval == phival) {
      print(sprintf("%s/%s = %.6f",phiname,moname,moval))
    } else {
      print(sprintf("DIFFERENT VALUES FOR %s/%s: %.6f (J) vs %.6f (M)",phiname,moname,phival,moval))
    }
  }
}
compare.plot.all <- function(phinames,dataMo,dataJ,combine=F,outdir="plots") {
  # Constructs a plot for all given variables from Modelica and Java data.
  #
  # Args:
  #   phinames: (named) vector of variablenames found in dataJ; the names(phinames)
  #             must contain the name of the corresponding variable in dataMo
  #   dataMo: modelica data as matrix
  #   dataJ: java data as matrix
  #   combine: if TRUE, a single PDF (named "compare.pdf") will be created, otherwise 
  #           one PDF will be created for each variable (named "compare-<variable>.pdf")
  #   outdir: the directory where to place the plots
  pdfheight <- 5
  pdfwidth <- 10
  if(!file.exists(outdir)) dir.create(outdir) #create output directory if necessary
  #extract time for x-axis of all plots
  timeMo <- dataMo[,"time"]
  timeJ <- dataJ[,"t"]
  if (combine) {
    pdfname <- file.path(outdir,"compare.pdf")
    combinedheight <- (length(phinames)-1)*pdfheight
    pdf(pdfname,width=pdfwidth,height=combinedheight)
    par(mfrow=c(length(phinames)-1,1)) #set number of subplots by row
  }
  for(moname in names(phinames)) {
    if(moname == "time") next
    phiname = phinames[moname]
    if(!combine) {
      pdfname <- sprintf("compare-%s%s.pdf",phiname,ifelse(phiname == "R","2",""))
      pdfname <- file.path(outdir,pdfname)
      pdf(pdfname,width=pdfwidth,height=pdfheight)
    }
    print(sprintf("%10s -> %s",phiname,pdfname))
    #construct plot; modelica data will determine plot bounds
    plot(timeMo,dataMo[,moname],type="l",col="red",xlab="time[s]",ylab=phiname)
    #add additional line with lines instead of plot
    lines(timeJ,dataJ[,phiname],type="l",col="blue")
    #add legend in top right corner
    legend(x="topright",legend=c("Modelica","Java"),lty=c(1,1),col=c("red","blue"))
    if(!combine) {
      dev.off() #flush/close output file
    }
  }
  if(combine) {
    dev.off() #flush/close output file
  }
}
nameMo <- "Kotani_full_res.csv"
nameJ <- "silicon000.phi"
n <- 1000
#load csv as matrix
dataMo <- as.matrix(read.csv(nameMo))
dataJ <- as.matrix(read.table(nameJ,header=T))
#subsample: take only n samples
facMo <- round(length(dataMo[,1])/n)
dataMo <- dataMo[seq(1,length(dataMo[,1]),facMo),]
facJ <- round(length(dataJ[,1])/n)
dataJ <- dataJ[seq(1,length(dataJ[,1]),facJ),]
#compare starting values
compare.print.first(phinames,dataMo,dataJ)
#call plot function
compare.plot.all(phinames,dataMo,dataJ,T)
compare.plot.all(phinames,dataMo,dataJ,F)
