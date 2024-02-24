import { Text, Textarea, VStack } from '@chakra-ui/react';

type Props = {
  label: string;
  value: string;
  setValue: React.Dispatch<React.SetStateAction<string>>;
  isReadOnly: boolean;
}

function Form(props: Props) {
  const onChange = (e: React.ChangeEvent<HTMLTextAreaElement>) => {
    props.setValue(e.target.value)
  }

  return (
    <>
      <VStack w='full' pt='0.7em'>
        <Text mb='0.3em'>{props.label}</Text>
        <Textarea
          value={props.value}
          onChange={onChange}
          size='lg'
          rows={15}
          isReadOnly={props.isReadOnly}
        >
        </Textarea>
      </VStack>
    </>
  )
}

export default Form
