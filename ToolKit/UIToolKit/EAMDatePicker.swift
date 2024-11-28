import SwiftUI

/// A custom date picker view with a scrollable wheel style, including title, text input, clear button, and done button.
struct EAMDatePicker: View {
    @State private var currentDate: Date?
    @State private var textInput: String = ""
    var title: String
    var dateRange: ClosedRange<Date>? = nil // Optional range for date selection
    var displayedComponents: DatePickerComponents = [.date]
    var onDone: (Date?) -> Void
    
    // Date Formatter for custom display
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy" // Custom format to display day, month, and year
        return formatter
    }()
    
    init(title: String? = nil, initialDate: Date?, onDone: @escaping (Date?) -> Void) {
        self.title = title ?? "Select Date"
        _currentDate = State(initialValue: initialDate) // Allow for nil initial value
        self.onDone = onDone
    }
    
    var body: some View {
        EAMVStack(style: .custom(spacing: 0, alignment: .center)) {
            EAMHStack(style: .none) {
                EAMText(text: title, typography: .bodyBold)
                    .constraint(alignment: .leading, padding: 0)
            }
            
            EAMHStack(style: .none) {
                EAMTextInput(text: $textInput,type: .date)
                    .padding(.trailing, 10)
                    
                EAMButton(text: "Clear", type: .secondary) {
                    textInput = "" // Clear the text input
                }  .frame(width: 70, height: 40)
            }
            .padding([.leading, .trailing])
            .padding(.vertical, 0)
            .frame(height: isPhone ? 60 : 80)
            
            DatePicker(
                "",
                selection: Binding(
                    get: { currentDate ?? Date() }, // Default to Date() if currentDate is nil
                    set: { newDate in
                        currentDate = newDate
                        textInput = dateFormatter.string(from: newDate) // Update TextField when date changes from DatePicker
                    }
                ),
                in: dateRange ?? Date.distantPast...Date.distantFuture, // Optional range
                displayedComponents: displayedComponents
            )
            .frame(width: 300)
            .padding(.vertical, 0)
            .datePickerStyle(WheelDatePickerStyle()) // Scrollable style
            
            EAMButton(text: "Done",type: .primary) {
                // Apply the selected date only when "Done" is clicked
                if let date = dateFormatter.date(from: textInput) {
                    onDone(date) // Notify about the change
                } else {
                    onDone(nil) // No valid date selected
                }
            }
            .frame(height: isPhone ? 40 : nil)
            .constraint(alignment: .bottom, padding: 0)
        }
        .background(EAMTheme.eamColors.surface)
        .padding(5)
        .overlay(
            RoundedRectangle(cornerRadius: 8) // Adjust corner radius for the border
                .stroke(Color.gray.opacity(0.4), lineWidth: 1) // Border color
                .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 0, y: 2) // Shadow
        )
        .onAppear {
            // Initialize text input with the formatted selectedDate
            if let date = currentDate {
                textInput = dateFormatter.string(from: date)
            } else {
                textInput = "" // Ensure textInput is empty if no date is set
            }
        }
    }
}
