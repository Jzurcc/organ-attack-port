extends Node2D

const CARD_SCENE_PATH = "res://Scenes/Card.tscn"
const HAND_COUNT = 1


var attack_deck = [
	"Immunity Boost!",
	"Immunity Boost!",
	"Immunity Boost!",
	"Immunity Boost!",
	"Immunity Boost!",
	"Vaccine!",
	"Vaccine!",
	"Vaccine!",
	"Contagious!",
	"Contagious!",
	"Contagious!",
	"Necrosis!",
	"Necrosis!",
	"Necrosis!",
	"Necrosis!F",
	"Sedate!",
	"Sedate!",
	"Metastasis!",
	"Metastasis!",
	"Cavity!",
	"Hypochondria!",
	"Ruptured Appendix!",
	"Transplant!",
	"Gallstones!",
	"Overactive Bladder!",
	"Lacerated Spleen!",
	"Hemorrhage!",
	"Botched Surgery!",
	"Stroke!",
	"Research!",
	"Research!F",
	"POISONED!",
	"Chronic Strep Throat!",
	"Crohn's!",
	"Appendicitis!",
	"Biliary Dyskinesia!",
	"Hepatosplenomegaly",
	"Chart Mix-up",
	"Glaucoma!",
	"Cystic Fibrosis!",
	"Medical Miracle!",
	"Love!",
	"Hyperplenism!",
	"Thyroiditis!",
	"Tracheal Stenosis!",
	"Arrhythmia!",
	"Total Colectomy!",
	"Infection!",
	"Vomit!",
	"Calcium Stones!",
	"Tonsil Stones!",
	"IBS-d!",
	"Neglect!",
	"Benign Tumor",
	"Esophageal Stricture!",
	"Heartburn!",
	"Hyperthyroidism!",
	"Foreign Object in Eye!",
	"Kidney Donor!",
	"Tonsillitis!",
	"Inflamed Taste Bud",
	"Scalding Coffee!",
	"Diabetes!",
	"Fatty Liver!",
	"Stomach Ulcer!",
	"Asthma!",
	"Hypothyroidism!",
	"Cirrhosis!",
	"Urinary Tract Infection!",
	"Mental Illness!",
	"Walking Pneumonia!",
	"Pancreatitis!",
	"Enamel Erosion!",
	"Heart Attack!",
	"Conjunctivitis!",
	"Medicine!",
	"Medicine!",
	"Narcolepsy!",
	"Narcolepsy!",
	"Congestion!",
	"Outbreak!",
	"Outbreak!",
	"Outbreak!",
	"Malpractice!",
	"It's Alive!",
	"Common Cold!",
	"Nosebleed!",
	"Acne!",
	"Muscle Contusion!",
	"Day Old Burrito!",
	"Cryopreservation!",
	"Fracture!",
	"By the Book!",
	"Osteoporosis!",
	"Clinical Audit!",
	"Multiple Sclerosis!",
	"Tendonitis!",
	"Cancer!",
	"Upper Respiratory Infection!",
	"Muscular Dystrophy!",
	"Situs Inversus!",
	"Psoriasis!",
]

func _ready():
	attack_deck.shuffle()
	#print($Area2D.collision_mask)
	pass


func draw_card():
	if $"../PlayerHand1".player_hand.size() < 5:
		var card_drawn = attack_deck[0]
		var card_scene = preload(CARD_SCENE_PATH)
		var new_card = card_scene.instantiate()
		$"../CardManager".add_child(new_card)
		new_card.name = card_drawn
		new_card.scale = Vector2(1, 1)
		new_card.get_node("Sprite").frame = Globals.ATTACKS[card_drawn][0]
		$"../PlayerHand1".add_card_to_hand(new_card)
		attack_deck.erase(card_drawn)
		if attack_deck.size() == 0:
			$Area2D/CollisionShape2D.disabled = true
			$Sprite.visible = false
