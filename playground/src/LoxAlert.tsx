import { Alert, AlertIcon, AlertTitle, Text } from "@chakra-ui/react";

type Props = {
  enabled: boolean;
}

function LoxAlert(props: Props) {
  if (!props.enabled) {
    return (<></>)
  }

  return (
    <>
      <Alert status='error' mt='1em' mb='0.5em'>
        <AlertIcon />
        <AlertTitle><Text color='black'>Failed to run the program!</Text></AlertTitle>
      </Alert>
    </>
  )
}

export default LoxAlert
