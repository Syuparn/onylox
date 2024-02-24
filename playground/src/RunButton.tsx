import { Button } from "@chakra-ui/react";

type Props = {
  label: string;
}

function RunButton(props: Props) {
  return (
    <>
      <Button
        size="lg"
        mt="0.4em"
        colorScheme="blackAlpha"
      >
        {props.label}
      </Button>
    </>
  )
}

export default RunButton
