class Contact {
  String? id;
  String? contactPhone;
  String? deliveryNotes;
  String? extraContactPhone;
  String? label;

  Contact({
    this.id,
    this.contactPhone,
    this.deliveryNotes,
    this.extraContactPhone,
    this.label,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json['id'] as String?,
        contactPhone: json['contactPhone'] as String?,
        deliveryNotes: json['deliveryNotes'] as String?,
        extraContactPhone: json['extraContactPhone'] as String?,
        label: json['label'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'contactPhone': contactPhone,
        'deliveryNotes': deliveryNotes,
        'extraContactPhone': extraContactPhone,
        'label': label,
      };
}
