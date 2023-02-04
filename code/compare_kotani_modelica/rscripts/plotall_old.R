#
# SiliconHeart heart rate simulation
# Copyright (C) 2013 Daniel Otto and Andreas Dominik, THM University of Applied Sciences, Giessen, Germany
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#  
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
# 
#options(echo=TRUE, verbose=TRUE)
library(gplots)

name <- commandArgs(TRUE)[1]
name.dat <- paste(name, ".phi", sep="")
name.hrv <- paste(name, ".hrv", sep="")
name.pdf <- paste(name, ".pdf", sep="")
name.log <- paste(name, ".log", sep="")
name.xsi <- paste(name, ".xsi", sep="")




make.plots <- function(data, sub.title) {
	
	plot(data$"t", data$"Phi", type="l", col="red", xlim=lim, ylim=c(0,1),
			main=paste("Pacemaker Phase for", name, sub.title, sep=" "),
			xlab="time [s]", ylab="Phi")
	
	plot(data$"t", data$"nu_b", type="l", col="red", xlim=lim, ylim=c(0, 3),
			main=paste( "Neuronal Avtivity for", name, sub.title, sep=" "),
			xlab="time [s]", ylab="nu_b/nu_s/nu_p")
	lines(data$"t", data$"nu_s", type="l", col="blue")
	lines(data$"t", data$"nu_p", type="l", col="green")
	legend( x="topright",
			legend = c("nu_b", "nu_s", "nu_p"),
			pch=16, lty=1,
			col=c("red", "blue", "green"))
	
	
	plot(data$"t", data$"P", type="l", col="blue", xlim=lim,
			main=paste( "Blood Pressure", name, sub.title, sep=" "),
			xlab="time [s]", ylab="P [mmHg]")
	
	
	plot(data$"t", data$"CcNe", type="l", col="red", xlim=lim, ylim=c(0,max(c(data$"CcNe", data$"CvNe"))),
			main=paste("Norepinephrine Concentrations", name, sub.title, sep=" "),
			xlab="time [s]", ylab="Conc.")
	lines(data$"t", data$"CvNe", col="blue")
	legend( x="topright",
			legend = c("cardiac conc.", "vascular conc."),
			pch=16, lty=1,
			col=c("red", "blue"))
	
	plot(data$"t", data$"R", type="l", xlim=lim, col="green",
			main=paste("Respiratory Influence", name, sub.title, sep=" "),
			xlab="time [s]", ylab="cos()")
	
	plot(data$"t", data$"r", type="l", col="red", xlim=lim,
			main=paste("Velocity of Resp.", name, sub.title, sep=" "),
			xlab="time [s]", ylab="-")
}


x <- read.table(name.dat, header=TRUE)
hrv <- read.table(name.hrv, header=TRUE)
xsi <- read.table(name.xsi, header=TRUE)


# plot log:
all.lines <- paste(readLines(name.log), collapse="\n")

pdf(name.pdf, paper="a4r")
textplot( all.lines, cex=0.7)
title(paste( "Results of Silicon Heart Simulation Model shm1", 
             "\n", "Job name: ", name, sep=" "))

# plot HRV complete time:
plot(hrv$"hrv", type="l", col="red", ylim=c(400,1400),
		main=paste("Heart-Rate Variablility", name, sep=" "), 
		xlab="Heart beat number", ylab="heart beat interval [ms]")

# plot HRV in 3 parts:
x.size <- length(hrv$"hrv")/3

par(mfrow=c(3,1))
plot(hrv$"hrv", type="l", col="red", ylim=c(400,1400),
                xlim=c(0,x.size),
		main=paste("Heart-Rate Variablility, (3 parts zoom)", name, sep=" "), 
		xlab="Heart beat number", ylab="heart beat interval [ms]")

plot(hrv$"hrv", type="l", col="red", ylim=c(400,1400),
                xlim=c(x.size, 2*x.size),
		xlab="Heart beat number", ylab="heart beat interval [ms]")

plot(hrv$"hrv", type="l", col="red", ylim=c(400,1400),
                xlim=c(2*x.size, length(hrv$"hrv")),
		xlab="Heart beat number", ylab="heart beat interval [ms]")



plot(hrv$"hrv", type="l", col="red", ylim=c(400,1400),
		main=paste("Heart-Rate Variablility (small view)", name, sep=" "), 
		xlab="Heart beat number", ylab="heart beat interval [ms]")

# plot noise
par(mfrow=c(2,1))
plot(xsi$"Xsi1", type="l", col="red",
		main=paste("Noise of baroreceptor activity", name, sep=" "),
		xlab="Heart beats", ylab="Xsi 1")
abline(h=0)

plot(xsi$"Xsi2", type="l", col="blue",
		main=paste("Noise of parasympathetic activity", name, sep=" "),
		xlab="Heart beats", ylab="Xsi ")
abline(h=0)

par(mfrow=c(1,1))


# plot complete time:
# ceate mask for down-sampling to 10000 points

size  <- round(length(x$"t") / 10000)
index <- c(1:length(x$"t"))
mask  <- (index %% size) == 0

small <- x[mask,]

# Limits:
m <- max(x$"t")
s <- min(x$"t")

lim <- c(s,m)
par(mfrow=c(1,1))
make.plots(small, sub.title=": Complete simulation time")

# plot first 100 sec
lim <- c(s,s+100)
make.plots(x, sub.title=": 1st 100 sec")

# plot last 20 sec
lim <- c(m-100,m)
make.plots(x, sub.title=": last 100 sec")

# plot 5 sec
lim <- c(m-200,m-195)
make.plots(x, sub.title=": detail (5 sec)")


dev.off()



