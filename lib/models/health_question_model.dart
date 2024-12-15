class HealthQuestionsModel {
  bool? haveDizzySpells;
  bool? highCholesterol;
  bool? boneOfJointProblems;
  bool? heartProblems;
  bool? currentlyPregnant;
  bool? diabetes;
  bool? thyroid;
  bool? heartAttack;
  bool? arthritis;
  bool? lungProblem;
  bool? highBP;
  bool? spineOrDiscProblem;
  bool? surgeryIn6Months;
  String? familyHistoryOfAboveConditions;
  String? other;

  HealthQuestionsModel({
    this.haveDizzySpells,
    this.highCholesterol,
    this.boneOfJointProblems,
    this.heartProblems,
    this.currentlyPregnant,
    this.diabetes,
    this.thyroid,
    this.heartAttack,
    this.arthritis,
    this.lungProblem,
    this.highBP,
    this.spineOrDiscProblem,
    this.surgeryIn6Months,
    this.familyHistoryOfAboveConditions,
    this.other,
  });

  Map<String, dynamic> toJson() {
    return {
      "Have_dizzy_spells": haveDizzySpells,
      "High_cholesterol": highCholesterol,
      "Bone_of_joint_problems": boneOfJointProblems,
      "Heart_Problems": heartProblems,
      "Currently_pregnant": currentlyPregnant,
      "Diabetes": diabetes,
      "Thyroid": thyroid,
      "Heart_attack": heartAttack,
      "Arthritis": arthritis,
      "lung_problem": lungProblem,
      "High_BP": highBP,
      "Spine_or_disc_problem": spineOrDiscProblem,
      "Surgery_in_6_months": surgeryIn6Months,
      "Family_history_of_above_conditions": familyHistoryOfAboveConditions,
      "Other": other,
    };
  }
}
