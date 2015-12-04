accessing
defaultLink
	^ MetaLink new
		metaObject: self description;
		selector: #handleContext:;
		arguments: #(context);
		optionOneShot: true;
		yourself