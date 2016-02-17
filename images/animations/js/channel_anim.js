/*\
 * deepcopy
 [method]
 * creates a deep copy of the given snap-element by creating an invisible clone in the image

 > Arguments
 - el (object) the object to copy
 = copy of the given object
\*/
deepcopy = function(el) {
	var nel = el.cloneNode(true);
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
	if (per < 0 || per > 1) { throw "argument per must be between 0 and 1, was "+per }
	var l = path.getTotalLength();
	var p = path.getPointAtLength(l * per);
	ion.setAttribute("cx", p.x);
	ion.setAttribute("cy", p.y);
	ion.style.transform = "rotate("+(p.alpha+90)+")";
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

/*\
 * makeAbs
 [method]
 * makes the path definition of a path node absolute (M instead of m, L instead of l, ...)

 > Arguments
 - path (snap.svg node) path object that should get an absolute definition 
\*/
makeAbs = function(path) {
	// author: Phrogz (http://stackoverflow.com/questions/9677885/convert-svg-path-to-absolute-commands)
	var x0,y0,x1,y1,x2,y2,segs = path.pathSegList;
  for (var x=0,y=0,i=0,len=segs.numberOfItems;i<len;++i){
    var seg = segs.getItem(i), c=seg.pathSegTypeAsLetter;
    if (/[MLHVCSQTA]/.test(c)){
      if ('x' in seg) x=seg.x;
      if ('y' in seg) y=seg.y;
    }else{
      if ('x1' in seg) x1=x+seg.x1;
      if ('x2' in seg) x2=x+seg.x2;
      if ('y1' in seg) y1=y+seg.y1;
      if ('y2' in seg) y2=y+seg.y2;
      if ('x'  in seg) x+=seg.x;
      if ('y'  in seg) y+=seg.y;
      switch(c){
        case 'm': segs.replaceItem(path.createSVGPathSegMovetoAbs(x,y),i);                   break;
        case 'l': segs.replaceItem(path.createSVGPathSegLinetoAbs(x,y),i);                   break;
        case 'h': segs.replaceItem(path.createSVGPathSegLinetoHorizontalAbs(x),i);           break;
        case 'v': segs.replaceItem(path.createSVGPathSegLinetoVerticalAbs(y),i);             break;
        case 'c': segs.replaceItem(path.createSVGPathSegCurvetoCubicAbs(x,y,x1,y1,x2,y2),i); break;
        case 's': segs.replaceItem(path.createSVGPathSegCurvetoCubicSmoothAbs(x,y,x2,y2),i); break;
        case 'q': segs.replaceItem(path.createSVGPathSegCurvetoQuadraticAbs(x,y,x1,y1),i);   break;
        case 't': segs.replaceItem(path.createSVGPathSegCurvetoQuadraticSmoothAbs(x,y),i);   break;
        case 'a': segs.replaceItem(path.createSVGPathSegArcAbs(x,y,seg.r1,seg.r2,seg.angle,seg.largeArcFlag,seg.sweepFlag),i);   break;
        case 'z': case 'Z': x=x0; y=y0; break;
      }
    }
    // Record the start of a subpath
    if (c=='M' || c=='m') x0=x, y0=y;
  }
}

/*\
 * findAndStore
 [method]
 * small convenience method that stores a copy of an element in an object

 > Arguments
 - image (snap document) document in which the element should be found
 - obj (object) where to store the object
 - key (string) key under which the object should be stored
 - xml_id (string) id of the element
\*/
findAndStore = function(image, obj, key, xml_id) {
	el = getById(image, xml_id);
	if (el === null) {
		throw "could not find any element with id "+xml_id
	}
	obj[key] = deepcopy(el).pathSegList;
}

/*\
 * forEachWithId
 [method]
 * invokes a callback for each element found that has an id starting with the given
 * prefix followed by an index number. The search will be started at index 0 and will end
 * when no element with the current index can be found.

 > Arguments
 - image (snap document) document in which the element should be found
 - prefix (string) prefix for the xml-id, search will start with id '<prefix>0'
 - f (function) callback that can either take only the element (with_index = false) or the element and the index as argument
 - with_index (boolean) if true, both the found element and the index of the element will be passed to the callback function (default false) 
 - ignore_missing (boolean) if false, an error will be thrown when no elements could be found (default false)
\*/
forEachWithId = function(image, prefix, f, with_index, ignore_missing) {
	if (with_index === undefined) { with_index = false; }
	if (ignore_missing === undefined) { ignore_missing = false; }
	var i = 0;
	var el;
	while (el = getById(image, prefix+i)) {
		if (with_index) { f(el, i); } else { f(el); }
		i++;
	}
	if (i == 0 && !ignore_missing) {
		throw "no elements found for prefix "+prefix;
	}
}

/*\
 * clip01
 [method]
 * Clips the given value to a value between 0 and 1

 > Arguments
 - x (number) the value to clip
 = clipped value between 0 and 1 
\*/
clip01 = function(x) {
	if (x < 0) { return 0; }
	if (x > 1) { return 1; }
	return x;
}


getById_snap = function(doc, id) {
	return doc.select("#"+id);
}

getById_dom = function(doc, id) {
	return doc.getElementById(id);
}

getById = getById_dom;

setFramework = function(fw) {
	if (fw == "snap.svg") {
		getById = getById_snap;
	} else if (fw == "none") {
		getById = getById_dom;
	} else {
		throw "unknown framework ("+fw+")";
	}
}

rotP = function(ang, x, y) {
	/*
	 * $1 $3 $5
	 * $2 $4 $6
	 *  0  0  1
	 */
	if (y === undefined) {
		// allow to pass an array instead of two separate values
		y = x[1];
		x = x[0];
	}
	trans = [Math.cos(ang), Math.sin(ang), -Math.sin(ang), Math.cos(ang)];
	trans.push(x - trans[0]*x - trans[2]*y);
	trans.push(y - trans[1]*x - trans[3]*y);
	return "matrix("+trans.join(",")+")";
}
