String codeBasicFormInput ="""
         QCard(
              title: "Basic Form Input",
              children: [
                QTextField(
                  label: "Name",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {},
                ),
                QNumberField(
                  label: "Age",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {},
                ),
                QDatePicker(
                  label: "Date",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    print("value: \$value");
                  },
                ),
                QTimePicker(
                  label: "Time",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    print("value: \$value");
                  },
                ),
                QNumberField(
                  label: "Price 2",
                  validator: Validator.required,
                  value: "15000",
                  pattern: "#,###",
                  locale: "en_US",
                  onChanged: (value) {
                    print("Product price: \$value");
                  },
                ),
                QDropdownField(
                  label: "Roles",
                  validator: Validator.required,
                  items: const [
                    {
                      "label": "Admin",
                      "value": "Admin",
                    },
                    {
                      "label": "Staff",
                      "value": "Staff",
                    }
                  ],
                  value: "Admin",
                  onChanged: (value, label) {},
                ),
                QCheckField(
                  label: "Club",
                  validator: Validator.atLeastOneitem,
                  items: const [
                    {
                      "label": "Persib",
                      "value": 101,
                      "checked": false,
                    },
                    {
                      "label": "Persikabo",
                      "value": 102,
                      "checked": true,
                    }
                  ],
                  onChanged: (values, ids) {},
                ),
                QSwitch(
                  label: "Member",
                  validator: Validator.atLeastOneitem,
                  items: const [
                    {
                      "label": "Private",
                      "value": 1,
                    },
                    {
                      "label": "Premium",
                      "value": 2,
                    }
                  ],
                  value: null,
                  onChanged: (values, ids) {},
                ),
                QAutoComplete(
                  label: "Favorite employee",
                  validator: Validator.required,
                  items: const [
                    {
                      "label": "Jackie Roo",
                      "value": "101",
                      "info": "Hacker",
                    },
                    {
                      "label": "Dan Milton",
                      "value": "102",
                      "info": "UI/UX Designer",
                    },
                    {
                      "label": "Ryper Roo",
                      "value": "103",
                      "info": "Android Developer",
                    }
                  ],
                  value: null,
                  onChanged: (value, label) {},
                ),
                QSearchField(
                  label: "Search",
                  value: null,
                  prefixIcon: Icons.search,
                  suffixIcon: null,
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                ),
              ],
            ),
""";