const ORGANS = { # [frame]
	"WILD": [94],
	"Heart": [95],
	"Spleen": [96],
	"Gallbladder": [97],
	"Bowels": [98],
	"Tongue": [99],
	"Lungs": [100],
	"Trachea": [101],
	"Liver": [102],
	"Teeth": [103],
	"Pancreas": [104],
	"Eyes": [105],
	"Appendix": [106],
	"Bladder": [107],
	"Brain": [108],
	"Esophagus": [109],
	"Tonsils": [110],
	"Stomach": [111],
	"Thyroid": [112],
	"Kidneys": [113],
	"Nose": [114],
	"Skin": [115],
	"Bones": [116],
	"Skeletal Muscles": [117]
}
# types: affliction, wild, necrosis, metastasis, resistance, cure, poison, tactical, bureaucracy
const ATTACKS = {# [frame, type, is_instant, [afflicts/removes], special_func]
	"Immunity Boost!": [0, "Resistance", true, [], null], #*
	"Vaccine!": [1, "Resistance", false, [], null], #*
	"Contagious!": [2, "Tactical", true, ["All"], null], #*
	"Necrosis!": [3, "Necrosis", false, ["All"], null], #*
	"Necrosis!F": [65, "Necrosis", true, ["All"], null], #*
	"Sedate!": [4, "Tactical", false, [], null], #*
	"Metastasis!": [5, "Metastasis", true, ["All"], null], #*
	"Cavity!": [6, "Affliction", false, ["Teeth"], null],
	"Hypochondria!": [7, "Wild", false, ["All"], null],
	"Ruptured Appendix!": [8, "Affliction", false, ["AppendixR"], null],
	"Transplant!": [9, "Tactical", false, [], null], #*
	"Gallstones!": [10, "Affliction", false, ["Gallbladder"], null],
	"Overactive Bladder!": [11, "Affliction", false, ["Gallbladder"], null],
	"Lacerated Spleen!": [12, "Affliction", false, ["Bladder"], null],
	"Hemorrhage!": [13, "Wild", false, ["All"], null],
	"Botched Surgery!": [14, "Wild", false, ["All"], null],
	"Stroke!": [15, "Affliction", false, ["Brain"], null],
	"Research!": [16, "Bureaucracy", false, [], null], #*
	"Research!F": [76, "Bureaucracy", true, [], null], #*
	"POISONED!": [17, "Poison", true, [], null], #*
	"Chronic Strep Throat!": [18, "Affliction", false, ["Tonsils"], null],
	"Crohn's!": [19, "Affliction", false, ["Bowels"], null],
	"Appendicitis!": [20, "Affliction", false, ["Appendix"], null],
	"Biliary Dyskinesia!": [21, "Affliction", false, ["Gallbladder"], null],
	"Hepatosplenomegaly": [22, "Affliction", false, ["Spleen", "Liver"], null],
	"Chart Mix-up": [23, "Bureaucracy", false, [], null], #*
	"Glaucoma!": [24, "Affliction", false, ["Eyes"], null],
	"Cystic Fibrosis!": [25, "Affliction", false, ["Lungs", "Pancreas"], null],
	"Medical Miracle!": [26, "Cure", false, [], null], #*
	"Love!": [27, "Affliction", false, ["Heart", "Stomach", "BrainR"], null],
	"Hyperplenism!": [28, "Affliction", false, ["Spleen"], null],
	"Thyroiditis!": [29, "Affliction", false, ["Thyroid"], null],
	"Tracheal Stenosis!": [30, "Affliction", false, ["Trachea"], null],
	"Arrhythmia!": [31, "Affliction", false, ["Heart"], null],
	"Total Colectomy!": [32, "Affliction", false, ["Bowels", "AppendixR"], null],
	"Infection!": [33, "Wild", false, ["All"], null],
	"Vomit!": [34, "Affliction", false, ["Stomach", "Esopaghus", "Tongue", "Teeth"], null],
	"Calcium Stones!": [35, "Affliction", false, ["Kidneys", "Bladder"], null],
	"Tonsil Stones!": [36, "Affliction", false, ["Tonsils"], null],
	"IBS-d!": [37, "Affliction", false, ["Bowels"], null],
	"Neglect!": [38, "Wild", false, ["All"], null],
	"Benign Tumor": [39, "Wild", false, ["All"], null],
	"Esophageal Stricture!": [40, "Affliction", false, ["Esopaghus"], null],
	"Heartburn!": [41, "Affliction", false, ["Esopaghus"], null],
	"Hyperthyroidism!": [42, "Affliction", false, ["Thyroid"], null],
	"Foreign Object in Eye!": [43, "Affliction", false, ["Eyes"], null],
	"Kidney Donor!": [44, "Affliction", false, ["Kidneys"], null],
	"Tonsillitis!": [45, "Affliction", false, ["Tonsils"], null],
	"Inflamed Taste Bud": [46, "Affliction", false, ["Tongue"], null],
	"Scalding Coffee!": [47, "Affliction", false, ["Tongue"], null],
	"Diabetes!": [48, "Affliction", false, ["Pancreas"], null],
	"Fatty Liver!": [49, "Affliction", false, ["Liver"], null],
	"Stomach Ulcer!": [50, "Affliction", false, ["Stomach"], null],
	"Asthma!": [51, "Affliction", false, ["Lungs", "Trachea"], null],
	"Hypothyroidism!": [52, "Affliction", false, ["Thyroid"], null],
	"Cirrhosis!": [53, "Affliction", false, ["Liver"], null],
	"Urinary Tract Infection!": [54, "Affliction", false, ["Bladder", "Kidneys"], null],
	"Mental Illness!": [55, "Affliction", false, ["Brain"], null],
	"Walking Pneumonia!": [56, "Affliction", false, ["Lungs", "Trachea"], null],
	"Pancreatitis!": [57, "Affliction", false, ["Pancreas", "Gallbladder"], null],
	"Enamel Erosion!": [58, "Affliction", false, ["Teeth"], null],
	"Heart Attack!": [59, "Affliction", false, ["Heart"], null],
	"Conjunctivitis!": [60, "Affliction", false, ["Eyes"], null],
	"Medicine!": [61, "Cure", false, [], null], #*
	"Narcolepsy!": [65, "Tactical", true, ["Spleen"], null], #*
	"Congestion!": [67, "Affliction", false, ["Nose"], null],
	"Outbreak!": [68, "Wild", true, ["All"], null],
	"Malpractice!": [69, "Wild", false, ["All"], null],
	"It's Alive!": [70, "Tactical", false, [], null], #*
	"Common Cold!": [71, "Tactical", false, [], null], #*
	"Nosebleed!": [72, "Affliction", false, ["Nose"], null],
	"Acne!": [73, "Affliction", false, ["Skin"], null],
	"Muscle Contusion!": [74, "Affliction", false, ["Skeletal Muscles", "Skin"], null],
	"Day Old Burrito!": [75, "Affliction", false, ["Bowels", "Stomach"], null],
	"Cryopreservation!": [77, "Resistance", true, [], null], #*
	"Fracture!": [78, "Affliction", false, ["Bones"], null],
	"By the Book!": [79, "Bureaucracy", false, [], null], #*
	"Osteoporosis!": [80, "Affliction", false, ["Bones"], null],
	"Clinical Audit!": [81, "Bureaucracy", true, [], null], #*
	"Multiple Sclerosis!": [82, "Wild", false, ["All"], null],
	"Tendonitis!": [83, "Affliction", false, ["Skeletal Muscles", "Bones"], null],
	"Cancer!": [84, "Wild", false, ["All"], null],
	"Upper Respiratory Infection!": [85, "Affliction", false, ["Nose", "Lungs", "Trachea"], null],
	"Muscular Dystrophy!": [86, "Affliction", false, ["Skeletal Muscles"], null],
	"Situs Inversus!": [87, "Tactical", true, [], null], #*
	"Psoriasis!": [88, "Affliction", false, ["Skin"], null]
}
