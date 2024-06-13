import { LightningElement, api } from 'lwc';

/*static resource*/
import CAR_HUB_PLACEHOLDER from '@salesforce/resourceUrl/placeholder'
export default class Placeholder extends LightningElement {
    @api message

    placeholder = CAR_HUB_PLACEHOLDER
}