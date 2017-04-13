#Basics of color theory - Color theory 
	color wheel
		primary color
		secondary color 
		tertiary color 
	additive color
		RGB model
	subtractive color
		RYB model 
	luminance
	components of color 
		lightness (light vs dark) 
		saturation (intense vs dull)
		hue (red, orange, yellow, green, blue, or purple)
	chroma
	split compliments
	RYB
	RGB
	CMY
	Traditional color theory
		Complementary colors 
			achromatic 
			maximum saturated 
	Warm vs cool colors 
		warm: red to yellow 
			advance or appear more active in a painting
			arouse & stimulate the viewer  
		cool: blue violet to blue green
			tend to reced in a painting 
			calm & relax the viewer
	 achromatic colors 
		chromatic content 
			lacking 
				unsaturated
				achromatic 
				near neutral
					can be any hue or lightness
					obtained by mixing pure colors with white, black or grey, or by mixing two complementary colors
					easily modified by adjacent more saturated colors and they appear to take on the hue complementary to the saturated col 
				neutral
					black, white, and all greys
					black decreases the apparent saturation or brightness of colors paired with it
					white shows off all hues to equal effect
				examples
					browns, tans, pastels and dark colors
	Tints and shades 
		when mixing light RGB is always white 
			lights are made brighter or dimmer by adjusting their brightness or energy level
		when mixing colorants the result is always darker and lower in chroma moves mixture towards neutral color
			lightness is adjusted through mixture with white, black or a color's complement 
		shades 
			adding black paint to a color
			adding its opposite or complementary color
				neutralizes without a shift in hue and darken if additive color is darker than the parent color
		tints 
			adding white paint to a color
			adding small amount of an adjacent color brings the hue of the mixture back in line with the parent color
	Split primary colors 
		two-dimensional color wheels 
		three-dimensional color solids 
			tools to teach beginners the essential relationships between colors 
	color harmony
		colors seen together to produce a pleasing affective response are said to be in harmony 
		human responses to color are both affective and cognitive 
		analogous colors 
			colors next to each other on the color wheel 
		triadic color scheme 
			any three colors approximately equidistant around a color wheel model 
			Feisner & Mahnke color combination guidelines 
	
# Additive Color 
	Additive Color 
		color created by mixing different light colors with Red Green and Blue being primary colors used in additive color systems (RGB)
		the full gamut of color available in any additive color system is defined by all the possibl combinations of all the possible luminosities of each primary color in that system
		presents color to the eye by emissions 
	additive secondary color system
		the combination of two of the standard three additive primary colors in equal proportions produces an additive secondary color cyan, magenta, yellow
		subtractive color use primaries that are secondaries of the addtive system 	
	Subtractive Color 	
		color is created by absorbing parts of the spectrum of light present in ordinary white light, by means of colored pigments of dyes.
	
# Gamut(color)
	color gamut is a certain complete subset of colors
	refers to the subset of colors which can be accurately represented in a given circumstance, such as within a given color space or by a certain output device
	also refers to the complete set of colors found within an image at a given time. in this context, digitizing a photograph, converting a digitized image to a different color space, or outputting it to a given medium using a certain output device generally alters its gamut, in the sense that some of the colors in the original are lost in the process. 
	
# Hue 
	one of the main properties (color appearance parameters) 
	the degree to which a stimulus can be described as similar to or different from stimuli that are described as red, green, blue, and yellow 
	
# Color appearance model (CAM)
	a mathematical model that seeks to describe the perceptual aspects of human color vision ie viewing conditions under which the appearance of a color does not tally with the corresponding physical measurement of the stimulus source
	XYZ color space 
		successfully models human color vision on this basic sensory level 		models presupposes specific viewing conditions
			if the viewing conditions are not constant two stimuli with identical XYZ tristimulus values will create different color appearances
	appearance parameters 
		hue, lightness, brightness, chroma, colorfulness and saturation
	Chromatic adaptation 
		the ability of human color perception to abstract from the white point or color temperature of the illuminating light source when observing a reflective object.
			a piece of white paper looks white no matter whether the illumination is blueish or yellowish. 
	chromatic adaptation transform 
		tries to emulate the behavior of abstracting the white point fo the illuminating light source 
		allows for easy distinction between simple tristimulus-based color models and color appearance models.
	Hue appearance 
		several effects impact the perception of hue by a human observer
			Bezold-Brucke hue shift 
				the hue of monochromatic light changes with luminance
			Abney effect
				the hue of monochromatic light changes with the addition of white light (which would be expected color-neutral)
	Contrast appearance 
		several  effects impact the perception of contrast by a human observer
			Stevens effect
				contrast increases with luminance 
			Bartleson-Breneman effect
				image contrast (of emissive images such as images on an LCD display) increases with the luminance of surround lighting 
	Colorfulness appearance 
		there is an effect which impacts the perception of colorfulness by a human observer
			Hunt effect 
				colorfulness increases with luminance 
	Brightness appearance 
		there is an effect which impacts the perception of brightness by a human observer 
			Helmholtz-Kohlrausch effect 
				Brightness increases with saturation 
	Spatial phenomena 
		only affect color at a specific location of an image 
			human brain interprets this location in a specific contextual way (shadow instead of gray color). also known as optical illusions. 
			especially hard to model because of their contextuality
		image color appearance models (iCAM)
			color appearance models that are trying to model spatial phenomena 
	Color appearance models 
		CIELAB
			attempt to create a universal model for color difference
			created a peceptually uniform color space 
				color space where identical spatial distance between two colors equals identical amount of perceived color difference 
			rudimentary color appearance model
			widely used 
			building blocks of color management in ICC profiles 
			omnipresent in digital imaging
			does not offer a full fledged chromatic adaption 
				performs the von Kries transform directly in the XYZ color space
					referred to as "wrong von Kries transform"
			ICC profiles circumvent this shortcoming by using the Bradford transformation matrix to the LMS color space
		Nayatani et al. model
			color appearance focuses on illumination engineering and the color rendering properties of light sources 
		Hunt model
			focuses on color image reproduction 
				incorporated rod cell responses 
				predicts a wide range of visual phenomena 
				significant impact on CIECAM02 
				complex and hard to use 
		RLAB
			focus on image reproduction	
			performs well for task simple to use 
			not comprehensive enough for other applications
		LLAB
			more comprehensive than RLAB
			simple but less simple than RLAB
		CIECAM97s
			comprehensive color appearance model
			complex and difficult to use
			widespread use
		IPT
			excels at providing a formulation for hue where a constant hue value equals a constant perceived hue, independent of the values of lightness and chroma
			well suited for gamut mapping implementations 
		CIECAM02
			successor to CIECAM97s 
			performs better and is simpler 
			"standard color appearance model"
		iCAM06
			image color appearance model 
				does not treat each pixel of an image independently but in the context of the complete image
			allows it to incorporate spatial color appearance parameters like contrast	
			first step to deal with spatial appearance phenomena
# Contrast (vision) 
	the difference in luminance of colour that makes an object distinguishable 
	in perception of the world contrast is determined by the difference in the color and brightness of the object and other objects within the same field of view
	human visual system is more sensitive to contrast than absolute luminance 
		we can perceive the world similarly regardless of the huge changes in illumination 
	the maximum contrast of an image is the contrast ratio or dynamic range
	Biological contrast sensitivity 
		band-pass filter shape peaking at 4 cycles per degree
			sensitivity drops off at either side of the peak
			human visual system most sensitive in detecting contrast differences occurring at 4 cycles per degree 
			high frequency cut off is about 60 cycles per degree
	Luminance contrast 	
		luminance difference / average luminance 
	Weber contrast	
		(luminance of the features - luminance of the background) / luminance of the background
		Weber fraction
			constant in Weber's law
		commonly used in cases where small features are present on a large uniform background (average luminance is approximately equal to the background luminance)
	Michelson contrast - visibility contrast 
		used for patterns where both bright and dark features are equivalent and take up similar fractions of the area (sine-wave gratings)
		(max luminance) - (min luminance) / (max luminance) + (min luminance)
	Root Mean Square (RMS) contrast
		does not depend on the angular frequency content or the spatial distribution of contrast in the image
		standard deviation of the pixel itensities 
	Contrast sensitivity 
		is a measure of the ability to discern between luminances of different levels in a static image
			distinguish bright and dim components of a static image
		varies between individuals (max at 20 years old, angular frequency of 2-5 cycles per degree)
		contrast sensitivity and visual acuity

# Field of view
	the extent of the observable world that is seen at any given moment 
	typically used in the sense of a restriction to what is visible by external apparatus 
	in human vision it is the visual field
		the number of degrees of visual angle during stable fixations of the eyes
		humans have almost 180 degree forward facing horizontal diameter of their visual field
		humans have binocular vision for 114 degree
			remaining 60-70 have no binocular vision
		binocular vision is important to depth perception and the basis for stereopsis
		color vision is concentrated in the center of the visual field 
		ability to perceive shape and motion stronger in the periphery
	optical instruments field of view
		angular field of view
			specified in degrees 
		linear field of view 
			specified as a ratio of lengths 
	machine vision 
		lens focal length and image sensor size sets up the fixed relationship between the field of view and the working distance
		field of view is the area of the inspetion captured on the camera's imager
		size of field of view and size of camera's imager directly affect the image resolution 
		working distance is the distance between the back of the lens and the target object
	
# Contrast ratio
	a property of a display system 
		defined as the ratio of the luminance of the brightest color (white) to that of the darkest color (black) that the system is capable of producing 
		high contrast ratio is a desired aspect of any display
	static contrast ratio
		the luminosity ratio comparing the brightest and darkest color the system is capable of producing simultaneously at any instant of time
	dynamic contrast ratio 
		the luminosity ratio comparing the brightest and darkest color the system is capable of producing over time while the picture is moving
	brightness 
		measured in candela per square metre
		refers to the emitted luminous intensity on screen

# Dynamic range
	the ratio between the largest and smallest values of a changeable quantity 
	human range
		sound
			can hear quiet murmu in a soundproofed room 
			can hear heavy metal concert
			difference about 100dB
		light
			can see objects in starlight 
			and bright sunny day
			difference about 90 dB
		humans must adjust slowly to reach acuity in the maximums and minimums 

# band-pass filter 
	passes frequencies within a certain range and rejects frequencies outside that range
	

# Angular Frequency
	scalar measure of rotation rate
	refers
		angular displacement per unit time
		rate of change of the phase of a sinusoidal waveform
		rate of change of the argument of the sine function
	
# Weber-Fechner law
	combines two laws of human perception which describe ways the resolution of perception diminishes for stimuli of greater magnitude
	weber's law 
		the just-noticeable difference between two stimuli is proportional to the magnitude of the stimuli (and the subjects sensitivity)
	Fechner's law
		subjective sensation is proportional to the logarithm of the stimulus intensity 
		perceived loudness/brightness is proportional to log of actual intensity measured witha n accurate nonhuman instrument 
	vision 
		the eye senses brightness approximately logarithmically over a moderate range (like power law over a wider range)
	
# Power law
	a functional relationship between two quantities where a relative change in one quantity results in a proportional relative change in the other quantity independent of the initial size of those quantity 

# Spatial frequency 
	a characteristic of any structure that is periodic across position in space
	a measure of how often sinusoidal components of the structure repeat per unit of distance 
	SI unit 
		cycles per meter
	visual perception
		number of cycles per degree of visual angle 
	spatial-frequency theory 
		refers to the theory that the visual cortex operates on a code of spatial frequency 
		not on code of straight edges and lines 
		principles 
			any visual stimulus can be represented by plotting the intensity of the light along lines running through it 
			any curve can be broken down into constituent sinve waves by Fourier analysis
	
# Sinusoid - Sine wave 
	a mathematical curve that describes a smooth repetitive oscillation 
		amplitude 
			peak deviation of the function from zero
		ordinary frequency 
			the number of cycles that occur each second of time
		angular frequency 
			the rate of change of the function arguments in units of radians per second
		phase 
			specifies in radians where the input = 0
	Fourier series 
		sinusoidal waves can be used as simple building blocks to describe any periodic waveform 
	
# Radian 
	the standard unit of angular measure 
	numerically equal to the length of a corresponding arc of a unit circle 		one radian is roughly 57.3 degrees 
	describe the plane angle subtended by a circular arc as the length of the arc divided by the radius of the arc
	
# grating 
	any regularly spaced collection of essentially identical, parallel, elongated elements 
	used as filters 
	specified by four parameters
		spatial frequency 
			the number of cycles occupying a particular distance 
		contrast 
			a measure of the difference in luminance between the light parts of the grating anf the dark parts (michelson contrast)
		phase 
			the position of the graph relative to some standard position 
		orientation 
			the angle the grating makes with some standard orientation 	
	sine-wave gratings are used in optics a lot to determine transfer function of lenses 
	
# Fourier analysis 
	the study of the way general functions may be represented or approximated by the sums of simpler trigonometric functions 
	Fourier synthesis 
		rebuilding the function from it's component pieces 
	Fourier transformation 
		breaking something down into it's component parts 
	signal processing
		Fourier analysis can isolate individual components of a compound waveform, concentrating them for easier detection etc.
	
# [Visual Acuity](https://en.wikipedia.org/wiki/Visual_acuity)
	refers to the clarity of vision 
		dependent on optical and neural factors 
			sharpness of the retinal focus within the eye
			health and functioning of the retina
			sensitivity of the interpretative faculty of the brain
		common cause of low visual acuity 
			ametropia(refractive error)
				errors in how light is refracted in the eyeball	
			astigmatism 
				rays that propagate in two perpendicular planes have different focus 
		
# [Angular resolution](https://en.wikipedia.org/wiki/Angular_resolution)
	also known as spatial resolution 
	the ability of any image-forming device to distinguish the small details of an object, major determinant of image resolution
	resolving power 
		the ability of an imaging device to seperate points of an object that are located at a small angular distance 
	imaging systems resolution can be limited by 
		aberration
			caused by geometrical optics and can be solved by increasing the optical quality 
		diffraction 
			caused by the wave nature of light and is deermined by the finite aperture of the optical element 
		the interplay between diffraction an aberration is measured by the point spread function
	point spread function(psf) 
		the narrower the aperture of the lens the more likely the PSF is dominated by diffraction	
			angular resolution can be estimated by Rayleigh criterion 

# [Aperture](https://en.wikipedia.org/wiki/Aperture)
	a hole or an opening through which light travels 		
	narrow 
		highly collimated rays are admitted 
		sharp focus at the image plane 
	wide 
		uncollimated rays are admitted 
		sharp focus only for rays with a certain focal length	
		image that is sharp around what the lens is focusing on 
	human eye
		pupil is the aperture 
	aperture stop 
		the stop that determines the ray cone angle and brightness at an image point 
	
# [Image plane](https://en.wikipedia.org/wiki/Image_plane)
	plane in the world which is identified with the plane of the monitor 
	optics 
		the plane that contains the object's projected image, lies beyond the focal plane 

# [Collimated light](https://en.wikipedia.org/wiki/Collimated_light)
	light whose rays are parallel and spread minimally as it propagates
	

# [Helmholtz-Kohlraush effect](https://en.wikipedia.org/wiki/Helmholtz%E2%80%93Kohlrausch_effect)
	a measure of the ratio between brightness and lightness
	entoptic phenomenon where the intense saturation of spectral hue is perceived as part of the color's luminance 
		this brightness is increased by saturation which grows stronger as saturation increases can be called chromatic luminance 
	lightness 
		colored lights seem brighter to humans than white light even when their liminance is the same
		more saturated colors are interpreted as the color's luminance and chroma, tricking us to believe that the colors are actually brighter 
		brightness of the object in respect to the light reflecting on it 
	brightness 
		affected most by what is surrounding the object 
			object looks lighter or darker depending on what is around it 
			appears different depending on the color of the object 
				more saturated object looks brighter than less saturated objects even when they have equal luminance 
		the intensity of the object independent of the light source 
	Helmholtz Color Coordinates 
		similar to the Munsell Color system 
		uses principals of wavelength and chroma of color for each hue to describe the location of when high saturation indicates a small amount of white 
	
# [Entoptic phenomenon](https://en.wikipedia.org/wiki/Entoptic_phenomenon)
	visual effects whose source is whithin the eye itself 
	entoptic images have a physical basis in the image cast upon the retina 
		different from optical illusions 
			perceptual effects that arise from interpretations of the image by the brain 
		cause by phenomena within the observers own eye 
	examples 
		Floaters 
			drifting squiggles 
		blue field entoptic phenomenon 
			tiny bright dots
		Haidinger's brush 
			subtle bowtie or hourglass shaped pattern that is seen when viewing a field with a component of blue light that is plane ot circularly polarized 
		Purkinje images
			reflections from the anterior and posterior surfaces of the cornea and the anterior and posterior surfaces of the lens
		Purkinje tree
			an image of the retinal blood vessels in one's own eye 
		Purkinje blue arcs
			associated with the activity of the nerves sending signals from where a spot of light is focussed on the retina near the fovea 
		phosphene 
			the perception of light without light actually entering the eye like when pressure applied to closed eyes
	
# [Color space](https://en.wikipedia.org/wiki/Color_space)
	a specific organization of colors 
	in combination with physical device profiling allows for reproducible representations of color in both analog and digital representations
	color model
		abstract mathematical model describing the way colors can be represented as tuples of numbers 
	print usually uses the CMYK color model 
		using subtractive primary colors of pigment 
	RGB 
		additive color mixing describes what kind of light needs to be emitted to produce a given color 
			individual values of red gren and blue 
		RGBA is a causing 
			uses an alpha to indicate transparency 
		common color spaces in the RGB color model 
			sRGB
			Adobe RGB 
			ProPhoto RGB
			scRGB
			CIE RGB
	CMYK
		uses subtractive color mixing 
		describes what kind of ink need to be applied so the light reflected from the substrate and through the inks produces a given color	
	YIQ
		formerly used in north america japan ect in television broadcasts for historical reasons 
		stores a luma value roughly analogous to luminance along with chroma values as approximate representations of the relative aounts of blue and red in the color 
	HSV(hue, saturation, value) - HSB(Hue, Saturation, Brightness)
		transformation of an RGB colorspace 
	HSL (Hue, Saturation, Lightness)
		lightness of a pure color is equal to the lightness of a medium gray

#[Munsell color system](https://en.wikipedia.org/wiki/Munsell_color_system)
	a color space that identifies colors based on three color dimensions 
		hue
		value(lightness)
		chroma
	official color system for soil research 
	represented cylindrically 
		hue 
			x-dimension
			degrees
			5 principal hues 
				red 
				yellow 
				green
				blue 
				purple
			5 intermediate hues
				yellow-red
				green-yellow
				blue-green
				purple-blue
				red-purple
			each is broken into 10 substeps with the intermediary as the mid point
			complimentary colors
				two colors of equal value and chroma on opposite sides of a hue circle
				mix additevely to the neutral gray of the same valye
		value 
			y-dimension
			0(black) - 10(white)
		chroma 
			z-dimension	
			radially outward from neutral 
			purity of a color (related to saturation)
			lower chroma are less pute 
				pastels
			no intrinsic upper limit to chroma 
				different areas of the color space have different maximal chroma coordinates 
					yellow colors 
						more potential chroma than light purples 
		color is specified by listing the three numbers for 
			hue 
			value 
			chroma

#[Colorimetry](https://en.wikipedia.org/wiki/Colorimetry)
	the science and technology used to quantify and describe physically the human color perception
	used equipment 
		tristimulus colorimeter
			measures the tristimulus values of a color
			used for color calibration in digital imaging 
		spectroradiometer
			measures the absolute spectral radiance or irradiance of a light source
		spectrophotometer 
			measures the spectral reflectance, transmittance, or relative irradiance of a color sample
		spectrocolorimeter 
			spectrophotometer that can calculate tristimulus values 
		densitometer
			measures the degree of light passing through or reflected by a subject 
		color tempature meter 
			measures the color temperature of an incident illuminant

#[Pastel](https://en.wikipedia.org/wiki/Pastel_(color))
	family of colors 
	when described in the HSV color space 	
		high value
		low to intermediate saturation
	described as 
		soothing 
		soft
		near neutral 
		milky 
		washed out 
		desaturated 
		lacking strong chromatic content
	



























 	

		
