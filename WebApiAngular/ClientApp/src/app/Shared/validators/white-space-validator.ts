import { FormControl } from '@angular/forms';
export class WhiteSpaceValidator {
	static canNotContainSpace(formControl: FormControl) {
		return formControl.value.indexOf(' ') >= 0 ? { canNotContainSpace: true } : null;
	}
}
