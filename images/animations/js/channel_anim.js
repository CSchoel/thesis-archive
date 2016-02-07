/*\
 * deepcopy
 [method]
 * creates a deep copy of the given snap-element by creating an invisible clone in the image

 > Arguments
 - el (object) the object to copy
 = copy of the given object
\*/
deepcopy = function(el) {
	var nel = el.clone();
	nel.attr({display: "none"});
	return nel;
}

/*\
 * rectRamp
 [method]
 * determines the activation percentage on a rectangular ramp function ( __/'''''\__ )

 > Arguments
 - t (number) the current time at which activation percentag should be evaluated
 - vals (array of number) array containing [incStart, incEnd, decStart, decEnd] (start/end times of increasing/decreasing ramp) 
 = activation percentage according to the ramp definition
\*/
rectRamp = function(t, vals) {
	var incStart = vals[0];
	var incEnd = vals[1];
	var decStart = vals[2];
	var decEnd = vals[3];
	var p;
	if (t < decStart) {
		p = 1.0*(t-incStart)/(incEnd-incStart);
	} else {
		p = 1.0 - 1.0*(t-decStart)/(decEnd-decStart);
	}
	if (p < 0) { p = 0; }
	else if (p > 1) { p = 1; }
	return p;
}

/*\
 * morph
 [method]
 * morphs a path to an intermediate state between a start and an end path

 > Arguments
 - per (number) the percentage how far the morph should lean towards fE
 - f (pathSegList) list of path segments for form that should be morphed
 - fS (pathSegList) list of path segments for start form
 - fE (pathSegList) list of path segments for end form
\*/
morph = function(per, f, fS, fE) {
	for (var i = 0; i < f.numberOfItems; i++) {
		morphPoint(per, f, fS, fE, i);
	}
}

/*\
 * morph
 [method]
 * morphs a single point in a path to an intermediate state between a start and an end path

 > Arguments
 - per (number) the percentage how far the morph should lean towards fE
 - f (pathSegList) list of path segments for form that should be morphed
 - fS (pathSegList) list of path segments for start form
 - fE (pathSegList) list of path segments for end form
 - pidx (number) index of point that should be morphed
\*/
morphPoint = function(per, f, fS, fE, pidx) {
	var p = f.getItem(pidx);
	var pS = fS.getItem(pidx);
	var pE = fE.getItem(pidx);
	if ("x" in p) {
		p.x = pS.x + per * (pE.x - pS.x);	
		p.y = pS.y + per * (pE.y - pS.y);
	}
	if ("x1" in p) {
		p.x1 = pS.x1 + per * (pE.x1 - pS.x1);	
		p.y1 = pS.y1 + per * (pE.y1 - pS.y1);
	}
	if ("x2" in p) {
		p.x2 = pS.x2 + per * (pE.x2 - pS.x2);	
		p.y2 = pS.y2 + per * (pE.y2 - pS.y2);
	}
}

/*\
 * moveAlongPath
 [method]
 * moves a particle (an ion) along a given path

 > Arguments
 - t (number) the current time at which position on the path should be evaluated
 - periods (array of array of number) array containing successive [start, end] entries defining start and end points of motion along the path 
\*/
moveAlongPath = function(t, periods, ion, path) {
	var i;
	var per = 0;
	for (i = 0; i < periods.length; i++) {
		if (t < periods[i][1]) {
			per = 1.0 * (t-periods[i][0]) / (periods[i][1] - periods[i][0])
			break;
		}
	}
	if (per < 0) { per = 0; }
	else if (per > 1) { per = 1; }
	setOnPath(per, ion, path);
}

/*\
 * setOnPath
 [method]
 * sets the center of an ellipse or circle to a given percentage along a given path

 > Arguments
 - per (number) the percentage of the path where the ellipse should be displayed
 - ion (circle or ellipse element) the element to move
 - path (path element) the path to which the circle/ellipse should be moved 
\*/
setOnPath = function(per, ion, path) {
	var l = path.getTotalLength();
	var p = path.getPointAtLength(l * per);
	ion.attr({cx: p.x, cy: p.y, transform: "r "+(p.alpha+90)});
}


/*\
 * periodOffsets
 [method]
 * Generates random offsets to add to period values for the moveAlongPath method.
 * This method is used to make ion movements seem more natural without having to define
 * movement periods for each ion separately.

 > Arguments
 - len (number) number of intervals to generate
 - rnd (number) offset values will be between -rnd and +rnd
 = array of period offset arrays ([startOffset, endOffset])
\*/
periodOffsets = function(len, rnd) {
	var p = [];
	for (var i = 0; i < len; i++) {
		var r  = (Math.random()-0.5)*2*rnd;
		p[i] = [r, r];
	}
	return p;
}

/*\
 * periods
 [method]
 * Generates period arrays based on a single start and end time.

 > Arguments
 - start (number) start of the first period
 - end (number) end of the last period
 - n (number) number of periods
 = array of n periods ranging from start to end
\*/
periods = function(start, end, n) {
	var len = 1.0 * (end - start) / n;
	var p = [];
	for (var i = 0; i < n; i++) {
		p[i] = [start+i*len, start+(i+1)*len];
	}
	return p;
}

/*\
 * addOff
 [method]
 * adds period offsets to base periods

 > Arguments
 - basePer (period array) base periods as array of arrays of start and end times
 - perOff (period array) period offsets as array of arrays of start and end offsets
 = new period array with offsets
\*/
addOff = function(basePer, perOff) {
	var mod = [];
	for (var i = 0; i < basePer.length; i++) {
		mod[i] = [basePer[i][0] + perOff[i][0], basePer[i][1] + perOff[i][1]];
	}
	return mod;
}