import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    fullName="Lwc Fundamental"
    title={aura}

    handlekeyChange(event){
        this.title= event.target.value
    }
}